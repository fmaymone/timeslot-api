require 'rails_helper'

RSpec.describe "V1::Groups", type: :request do
  let(:json) { JSON.parse(response.body) }

  # invite
  describe "POST /v1/groups/:group_id/members/:user_id" do
    let(:user) { create(:user) }

    describe "user can invite" do
      let(:group) { create(:group, owner: user) }

      it "returns created" do
        post "/v1/groups/#{group.id}/members/#{user.id}"
        expect(response.status).to be(201)
      end

      it "creates a membership with state 'invited'" do
        expect {
          post "/v1/groups/#{group.id}/members/#{user.id}"
        }.to change(Membership, :count).by(1)
        membership = Membership.last
        expect(membership.invited?).to be true
      end

      it "doesn't add user to group" do
        skip
        expect {
          post "/v1/groups/#{group.id}/members/#{user.id}"
        }.not_to change(group.members, :count)
      end

      describe "existing membership" do
        describe "duplicate invitation" do
          let!(:membership) { create(:membership, user: user, group: group) }

          it "returns ok" do
            post "/v1/groups/#{group.id}/members/#{user.id}"
            expect(response.status).to be(200)
          end

          it "are not (re-)created " do
            expect {
              post "/v1/groups/#{group.id}/members/#{user.id}"
            }.not_to change(Membership, :count)
          end
        end

        describe "active group member" do
          let!(:membership) {
            create(:membership, :active, user: user, group: group)
          }
          it "returns forbidden" do
            post "/v1/groups/#{group.id}/members/#{user.id}"
            expect(response.status).to be(403)
          end
        end

        describe "non active group member" do
          let!(:membership) {
            create(:membership, :inactive, user: user, group: group)
          }
          it "returns Created", :focus, :db do
            post "/v1/groups/#{group.id}/members/#{user.id}"
            expect(response.status).to be(201)
          end

          it "memberships are not (re-)created " do
            expect {
              post "/v1/groups/#{group.id}/members/#{user.id}"
            }.not_to change(Membership, :count)
          end

          it "changes membership state to 'invited'" do
            post "/v1/groups/#{group.id}/members/#{user.id}"
            membership.reload
            expect(membership.invited?).to be true
          end

        end
      end
    end

    describe "user can't invite" do
      let!(:user) { create(:user) } # remove when current_user is implemented
      let(:group) do
        create(:group, owner: create(:user), subs_can_invite: false)
      end

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/members/#{user.id}"
        expect(response.status).to be(403)
      end

      it "doesn't create membership" do
        expect {
          post "/v1/groups/#{group.id}/members/#{user.id}"
        }.not_to change(Membership, :count)
      end
    end
  end

  # handle_invite
  describe "POST /v1/groups/:group_id/members" do
    let(:current_user) { create(:user) }
    let(:group) { create(:group) }
    let!(:membership) do
      create(:membership, :invited, user: current_user, group: group)
    end
    let(:params) { { group: { invite: 'accept' } } }

    describe "accept invite" do
      it "returns success" do
        post "/v1/groups/#{group.id}/members", params
        expect(response.status).to be(200)
      end

      it "changes membership state to active" do
        post "/v1/groups/#{group.id}/members", params
        membership.reload
        expect(membership.active?).to be true
      end

      it "adds user to group" do
        skip
        expect {
          post "/v1/groups/#{group.id}/members", params
        }.to change(group.members, :count).by(1)
      end
    end

    describe "refuse invite" do
      let(:params) { { group: { invite: 'refuse' } } }

      it "returns success" do
        post "/v1/groups/#{group.id}/members", params
        expect(response.status).to be(200)
      end

      it "changes membership state to refused" do
        post "/v1/groups/#{group.id}/members", params
        membership.reload
        expect(membership.refused?).to be true
      end
    end

    describe "no invitation" do
      let!(:membership) do
        create(:membership, :inactive, user: current_user, group: group)
      end

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/members", params
        expect(response.status).to be(403)
      end

      it "doesn't changes membership state" do
        expect {
          post "/v1/groups/#{group.id}/members", params
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      let(:membership) {}

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/members", params
        expect(response.status).to be(403)
      end
    end
  end

  # leave
  describe "DELETE /v1/groups/:group_id/members" do
    let(:owner) { create(:user) }
    let(:member) { create(:user) }
    let(:group) { create(:group, owner: owner) }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: member, group: group)
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
        create(:membership, :inactive, user: member, group: group)
      end

      it "returns forbidden" do
        delete "/v1/groups/#{group.id}/members"
        expect(response.status).to be(403)
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
    let(:owner) { create(:user) }
    let(:member) { create(:user) }
    let(:group) { create(:group, owner: owner) }

    describe "current user is group owner" do
      let!(:owner) { create(:user) } # remove when current_user is implemented

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

      describe "membership not active" do
        let!(:membership) do
          create(:membership, :inactive, user: member, group: group)
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
    end

    describe "current user not group owner" do
      let!(:non_owner) { create(:user) } # remove when current_user is implemented
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
    let(:member) { create(:user) }
    let(:group) { create(:group, owner: owner) }
    let(:params) { { group: { notifications: 'false' } } }

    describe "current user is group member" do
      describe "membership active" do
        let!(:membership) do
          create(:membership, :active, user: member, group: group,
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
