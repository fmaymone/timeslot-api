require 'rails_helper'

RSpec.describe "V1::Groups", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user) }
  before(:each) { ApplicationController.new.current_user = current_user }

  # create
  describe "POST /v1/groups" do
    let(:new_params) { { name: "bar" } }

    it "creates a new group" do
      expect {
        post "/v1/groups", new_params
      }.to change(Group, :count)
      expect(Group.last.name).to eq "bar"
    end

    it "adds the owner as a group member" do
      post "/v1/groups", new_params
      expect(Group.last.members).to include current_user
    end

    it "adds an group image" do
      post "/v1/groups", new_params.merge(image: { publicId: 'foobar' })
      expect(json["image"]).to eq "foobar"
    end
  end

  # update
  describe "PATCH /v1/groups/:group_id" do
    let(:new_params) { { name: "bar" } }

    describe "user is group owner" do
      let(:group) { create(:group, owner: current_user, name: "foo") }

      it "returns OK" do
        patch "/v1/groups/#{group.id}", new_params
        expect(response.status).to be(200)
      end

      it "updates group name" do
        patch "/v1/groups/#{group.id}", new_params
        group.reload
        expect(group.name).to eq "bar"
      end

      describe "add image" do
        let(:public_id) { attributes_for(:real_image)[:public_id] }
        let(:img_params) { { image: { publicId: public_id } } }

        describe "new" do
          it "returns OK" do
            patch "/v1/groups/#{group.id}", img_params
            expect(response.status).to be(200)
          end

          it "sets group image" do
            patch "/v1/groups/#{group.id}", img_params
            expect(group.image.public_id).to eq public_id
          end
        end

        describe "overwrite existing" do
          let(:group) {
            create(:group, :with_image, owner: current_user, name: "foo")
          }
          it "returns OK" do
            patch "/v1/groups/#{group.id}", img_params
            expect(response.status).to be(200)
            expect(group.image.public_id).to eq public_id
          end
        end

        describe "invalid" do
          let(:img_params) { { image: { public_id: nil } } }

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
  describe "POST /v1/groups/:group_id/members" do
    let(:others) { create_list(:user, 3) }
    let(:user_ids) { { ids: others.collect(&:id) } }

    describe "user can invite" do
      let!(:group) { create(:group, owner: current_user) }

      it "returns created" do
        post "/v1/groups/#{group.id}/members", user_ids
        expect(response.status).to be(201)
      end

      it "returns a list of all users related to that group" do
        post "/v1/groups/#{group.id}/members", user_ids
        expect(json).to have_key "related"
        # group owner is automatically an active member too
        expect(json['related'].size).to eq 4
      end

      it "creates new memberships with state 'invited' for all new members" do
        expect {
          post "/v1/groups/#{group.id}/members", user_ids
        }.to change(Membership, :count).by(others.size)
        others.each do |id|
          expect(Membership.where(user_id: id).first.invited?).to be true
        end
      end

      it "doesn't create new memberships for already invited members" do
        create(:membership, :invited, user: others.first, group: group)

        expect {
          post "/v1/groups/#{group.id}/members", user_ids
        }.to change(Membership, :count).by(others.size - 1)
      end

      it "doesn't create new memberships for already active members" do
        create(:membership, :active, user: others.first, group: group)

        expect {
          post "/v1/groups/#{group.id}/members", user_ids
        }.to change(Membership, :count).by(others.size - 1)
      end

      it "re-invites users who had left the group or rejected a previous invitation" do
        create(:membership, :left, user: others.first, group: group)
        create(:membership, :refused, user: others.last, group: group)

        expect {
          post "/v1/groups/#{group.id}/members", user_ids
        }.to change(Membership, :count).by(others.size - 2)
        membership1 = Membership.where(user_id: others.first).first
        membership2 = Membership.where(user_id: others.last).first
        expect(membership1.invited?).to be true
        expect(membership2.invited?).to be true
      end

      it "doesn't add users to group" do
        expect {
          post "/v1/groups/#{group.id}/members", user_ids
        }.not_to change(group.members, :count)
      end
    end

    describe "user can't invite" do
      let!(:group) do
        create(:group, owner: create(:user), members_can_invite: false)
      end

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/members", user_ids
        expect(response.status).to be(403)
      end

      it "doesn't create membership" do
        expect {
          post "/v1/groups/#{group.id}/members", user_ids
        }.not_to change(Membership, :count)
      end
    end
  end

  # invite
  describe "POST /v1/groups/:group_id/members" do
    let(:other_users) { create_list(:user, 5) }
    let(:ids) { other_users.collect(&:id) }

    describe "user can invite" do
      let!(:group) { create(:group, owner: current_user) }

      it "returns created" do
        post "/v1/groups/#{group.id}/members", { ids: ids }
        expect(response.status).to be(201)
      end

      it "creates a membership with state 'invited'" do
        expect {
          post "/v1/groups/#{group.id}/members", { ids: ids }
        }.to change(Membership, :count).by ids.size
        membership = Membership.last
        expect(membership.invited?).to be true
      end

      it "doesn't add user to group" do
        expect {
          post "/v1/groups/#{group.id}/members", { ids: ids }
        }.not_to change(group.members, :count)
      end

      describe "existing membership" do
        describe "duplicate invitation" do
          let!(:membership) {
            create(:membership, user: other_users.first, group: group)
          }
          it "returns ok" do
            post "/v1/groups/#{group.id}/members", { ids: ids }
            expect(response.status).to be(201)
          end

          it "are not (re-)created " do
            expect {
              post "/v1/groups/#{group.id}/members", { ids: [ids.first] }
            }.not_to change(Membership, :count)
          end
        end

        describe "active group member" do
          let!(:membership) {
            create(:membership, :active, user: other_users.first, group: group)
          }
          it "returns OK" do
            post "/v1/groups/#{group.id}/members", { ids: ids }
            expect(response.status).to be(201)
          end
        end

        describe "non active group member" do
          let!(:membership) {
            create(:membership, :left, user: other_users.first, group: group)
          }
          it "returns Created" do
            post "/v1/groups/#{group.id}/members", { ids: ids }
            expect(response.status).to be(201)
          end

          it "memberships are not (re-)created " do
            expect {
              post "/v1/groups/#{group.id}/members", { ids: [ids.first] }
            }.not_to change(Membership, :count)
          end

          it "changes membership state to 'invited'" do
            post "/v1/groups/#{group.id}/members", { ids: ids }
            membership.reload
            expect(membership.invited?).to be true
          end
        end
      end
    end

    describe "user can't invite" do
      let!(:group) do
        create(:group, owner: create(:user), members_can_invite: false)
      end

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/members",{ ids: ids }
        expect(response.status).to be(403)
      end

      it "doesn't create membership" do
        expect {
          post "/v1/groups/#{group.id}/members",{ ids: ids }
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

      it "changes membership state to 'left'" do
        delete "/v1/groups/#{group.id}/members"
        membership.reload
        expect(membership.left?).to be true
      end
    end

    describe "group already left" do
      let!(:membership) do
        create(:membership, :left, user: current_user, group: group)
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
        delete "/v1/groups/#{group.id}/members/#{member.id}"
        expect(response.status).to be(403)
      end
    end
  end

  # settings
  describe "PATCH /v1/groups/:group_id/members" do
    let(:owner) { create(:user) }
    let(:group) { create(:group, owner: owner) }
    let(:params) { { settings: { notifications: 'false' } } }

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
        let!(:membership) do
          create(:membership, :left, user: current_user, group: group,
                 notifications: true)
        end

        it "returns Forbidden" do
          patch "/v1/groups/#{group.id}/members", params
          expect(response).to have_http_status :forbidden
        end

        it "doesn't change notifications state" do
          expect {
            patch "/v1/groups/#{group.id}/members", params
          }.not_to change(membership, :notifications)
        end
      end
    end

    describe "current user not group member" do
      it "returns Forbidden" do
        patch "/v1/groups/#{group.id}/members", params
        expect(response).to have_http_status :forbidden
      end
    end
  end
end
