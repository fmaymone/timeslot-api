require 'rails_helper'

RSpec.describe "V1::Groups", type: :request do
  let(:json) { JSON.parse(response.body) }

  # invite
  describe "POST /v1/groups/:group_id/members/:user_id" do
    let(:user) { create(:user) }

    describe "can invite" do
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

      describe "duplicate invitations" do
        let!(:membership) { create(:membership, user: user, group: group) }

        it "returns ok" do
          post "/v1/groups/#{group.id}/members/#{user.id}"
          expect(response.status).to be(200)
        end

        it "are not created " do
          expect {
            post "/v1/groups/#{group.id}/members/#{user.id}"
          }.not_to change(Membership, :count)
        end
      end
    end

    describe "can't invite" do
      let!(:user) { create(:user) } # remove when current_user is implemented
      let(:group) do
        create(:group, owner: create(:user), subs_can_invite: false)
      end

      it "returns forbidden" do
        post "/v1/groups/#{group.id}/members/#{user.id}"
        expect(response.status).to be(403)
      end
    end
  end
end
