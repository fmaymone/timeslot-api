require 'rails_helper'

RSpec.describe "V1::Groups", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user) }
  before(:each) { ApplicationController.new.current_user = current_user }

  # update
  describe "PATCH /v1/groups/:group_id" do
    let(:new_params) { { group: { name: "bar" } } }

    describe "user is group owner" do
      let(:group) { create(:group, owner: current_user, name: "foo") }

      it "returns No Content" do
        patch "/v1/groups/#{group.id}", new_params
        expect(response.status).to be(204)
      end

      it "updates group name" do
        patch "/v1/groups/#{group.id}", new_params
        group.reload
        expect(group.name).to eq "bar"
      end

      describe "add image" do
        let(:public_id) { attributes_for(:real_image)[:public_id] }
        let(:img_params) { { group: { newMedia: { public_id: public_id } } } }

        describe "new" do
          it "returns created" do
            patch "/v1/groups/#{group.id}", img_params
            expect(response.status).to be(201)
          end

          it "sets group image" do
            patch "/v1/groups/#{group.id}", img_params
            expect(group.image.first.public_id).to eq public_id
          end
        end

        describe "overwrite existing" do
          let(:group) {
            create(:group, :with_image, owner: current_user, name: "foo")
          }
          it "returns created" do
            patch "/v1/groups/#{group.id}", img_params
            expect(response.status).to be(201)
            expect(group.image.first.public_id).to eq public_id
          end
        end

        describe "invalid" do
          let(:img_params) { { group: { newMedia: { public_id: nil } } } }

          it "returns 422" do
            patch "/v1/groups/#{group.id}", img_params
            expect(response.status).to be(422)
          end

          it "doesn't set group image" do
            expect {
              patch "/v1/groups/#{group.id}", img_params
            }.not_to change(group, :image)
          end
        end
      end
    end

    describe "user not group owner" do
      let(:group) { create(:group, name: "foo") }

      it "returns Forbidden" do
        patch "/v1/groups/#{group.id}", new_params
        expect(response.status).to be(403)
      end

      it "doesn't change group name" do
        expect {
          patch "/v1/groups/#{group.id}", new_params
        }.not_to change(group, :name)
      end
    end
  end

  # invite
  describe "POST /v1/groups/:group_id/members/:user_id" do
    describe "user can invite" do
      let(:group) { create(:group, owner: current_user) }

      it "returns created" do
        post "/v1/groups/#{group.id}/members/#{current_user.id}"
        expect(response.status).to be(201)
      end

      it "creates a membership with state 'invited'" do
        expect {
          post "/v1/groups/#{group.id}/members/#{current_user.id}"
        }.to change(Membership, :count).by(1)
        membership = Membership.last
        expect(membership.invited?).to be true
      end

      it "doesn't add user to group" do
        expect {
          post "/v1/groups/#{group.id}/members/#{current_user.id}"
        }.not_to change(group.members, :count)
      end

      describe "existing membership" do
        describe "duplicate invitation" do
          let!(:membership) {
            create(:membership, user: current_user, group: group)
          }
          it "returns ok" do
            post "/v1/groups/#{group.id}/members/#{current_user.id}"
            expect(response.status).to be(200)
          end

          it "are not (re-)created " do
            expect {
              post "/v1/groups/#{group.id}/members/#{current_user.id}"
            }.not_to change(Membership, :count)
          end
        end

        describe "active group member" do
          let!(:membership) {
            create(:membership, :active, user: current_user, group: group)
          }
          it "returns OK" do
            post "/v1/groups/#{group.id}/members/#{current_user.id}"
            expect(response.status).to be(200)
          end
        end

        describe "non active group member" do
          let!(:membership) {
            create(:membership, :inactive, user: current_user, group: group)
          }
          it "returns Created" do
            post "/v1/groups/#{group.id}/members/#{current_user.id}"
            expect(response.status).to be(201)
          end

          it "memberships are not (re-)created " do
            expect {
              post "/v1/groups/#{group.id}/members/#{current_user.id}"
            }.not_to change(Membership, :count)
          end

          it "changes membership state to 'invited'" do
            post "/v1/groups/#{group.id}/members/#{current_user.id}"
            membership.reload
            expect(membership.invited?).to be true
          end

        end
      end
    end

    describe "user can't invite" do
      let(:group) do
        create(:group, owner: create(:user), members_can_invite: false)
      end

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/members/#{current_user.id}"
        expect(response.status).to be(403)
      end

      it "doesn't create membership" do
        expect {
          post "/v1/groups/#{group.id}/members/#{current_user.id}"
        }.not_to change(Membership, :count)
      end
    end
  end

  # accept_invite
  describe "POST /v1/groups/:group_id/accept" do
    let(:group) { create(:group) }
    let!(:membership) do
      create(:membership, :invited, user: current_user, group: group)
    end

    describe "existing invitation" do
      it "returns success" do
        post "/v1/groups/#{group.id}/accept"
        expect(response.status).to be(200)
      end

      it "changes membership state to active" do
        post "/v1/groups/#{group.id}/accept"
        membership.reload
        expect(membership.active?).to be true
      end

      it "adds user to group" do
        expect {
          post "/v1/groups/#{group.id}/accept"
        }.to change(group.members, :count).by(1)
      end
    end

    describe "no invitation" do
      let!(:membership) do
        create(:membership, :inactive, user: current_user, group: group)
      end

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/accept"
        expect(response.status).to be(403)
      end

      it "doesn't changes membership state" do
        expect {
          post "/v1/groups/#{group.id}/accept"
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      let(:membership) {}

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/accept"
        expect(response.status).to be(403)
      end
    end
  end

  # refuse_invite
  describe "POST /v1/groups/:group_id/refuse" do
    let(:group) { create(:group) }
    let!(:membership) do
      create(:membership, :invited, user: current_user, group: group)
    end

    describe "existing invitation" do
      let(:params) { { group: { invite: 'refuse' } } }

      it "returns success" do
        post "/v1/groups/#{group.id}/refuse"
        expect(response.status).to be(200)
      end

      it "changes membership state to refused" do
        post "/v1/groups/#{group.id}/refuse"
        membership.reload
        expect(membership.refused?).to be true
      end
    end

    describe "no invitation" do
      let!(:membership) do
        create(:membership, :inactive, user: current_user, group: group)
      end

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/refuse"
        expect(response.status).to be(403)
      end

      it "doesn't changes membership state" do
        expect {
          post "/v1/groups/#{group.id}/refuse"
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      let(:membership) {}

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/refuse"
        expect(response.status).to be(403)
      end
    end
  end

  # leave
  describe "DELETE /v1/groups/:group_id/members" do
    let(:group) { create(:group, owner: create(:user)) }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: current_user, group: group)
      end

      it "returns OK" do
        delete "/v1/groups/#{group.id}/members"
        expect(response.status).to be(200)
      end

      it "changes membership state to 'inactive'" do
        delete "/v1/groups/#{group.id}/members"
        membership.reload
        expect(membership.inactive?).to be true
      end
    end

    describe "membership not active" do
      let!(:membership) do
        create(:membership, :inactive, user: current_user, group: group)
      end

      it "returns OK" do
        delete "/v1/groups/#{group.id}/members"
        expect(response.status).to be(200)
      end

      it "doesn't changes membership state" do
        expect {
          delete "/v1/groups/#{group.id}/members"
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      it "returns forbidden" do
        delete "/v1/groups/#{group.id}/members"
        expect(response.status).to be(403)
      end
    end
  end

  # kick
  describe "DELETE /v1/groups/:group_id/members/:user_id" do
    let(:member) { create(:user) }
    let(:group) { create(:group, owner: current_user) }

    describe "current user is group owner" do
      describe "membership active" do
        let!(:membership) do
          create(:membership, :active, user: member, group: group)
        end

        it "returns OK" do
          delete "/v1/groups/#{group.id}/members/#{member.id}"
          expect(response.status).to be(200)
        end

        it "changes membership state to 'kicked'" do
          delete "/v1/groups/#{group.id}/members/#{member.id}"
          membership.reload
          expect(membership.kicked?).to be true
        end
      end

      describe "membership invited" do
        let!(:membership) do
          create(:membership, :invited, user: member, group: group)
        end

        it "returns OK" do
          delete "/v1/groups/#{group.id}/members/#{member.id}"
          expect(response.status).to be(200)
        end

        it "changes membership state to 'kicked'" do
          delete "/v1/groups/#{group.id}/members/#{member.id}"
          membership.reload
          expect(membership.kicked?).to be true
        end
      end

      describe "membership not active nor invited" do
        let!(:membership) do
          create(:membership, :inactive, user: member, group: group)
        end

        it "returns OK" do
          delete "/v1/groups/#{group.id}/members/#{member.id}"
          expect(response.status).to be(200)
        end

        it "doesn't changes membership state" do
          expect {
            delete "/v1/groups/#{group.id}/members/#{member.id}"
          }.not_to change(membership, :state)
        end
      end
    end

    describe "current user not group owner" do
      let(:group) { create(:group, owner: create(:user)) }
      let!(:membership) do
        create(:membership, :active, user: member, group: group)
      end

      it "returns forbidden" do
        delete "/v1/groups/#{group.id}/members/#{member.id}"
        expect(response.status).to be(403)
      end

      it "doesn't changes membership state" do
        expect {
          delete "/v1/groups/#{group.id}/members/#{member.id}"
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      it "returns forbidden" do
        delete "/v1/groups/#{group.id}/members/#{current_user.id}"
        expect(response.status).to be(403)
      end
    end
  end

  # settings
  describe "PATCH /v1/groups/:group_id/members" do
    let(:owner) { create(:user) }
    let(:group) { create(:group, owner: owner) }
    let(:params) { { group: { notifications: 'false' } } }

    describe "current user is group member" do
      describe "membership active" do
        let!(:membership) do
          create(:membership, :active, user: current_user, group: group,
                 notifications: true)
        end

        it "returns OK" do
          patch "/v1/groups/#{group.id}/members", params
          expect(response.status).to be(200)
        end

        it "changes notifications state" do
          patch "/v1/groups/#{group.id}/members", params
          membership.reload
          expect(membership.notifications).to be false
        end
      end

      describe "membership not active" do
      end
    end

    describe "current user not group member" do
    end
  end
end
