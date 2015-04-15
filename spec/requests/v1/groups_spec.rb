require 'rails_helper'

RSpec.describe "V1::Groups", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  # create
  describe "POST /v1/groups" do
    let(:new_params) { { name: "bar" } }

    it "creates a new group" do
      expect {
        post "/v1/groups", new_params, auth_header
      }.to change(Group, :count)
      expect(Group.last.name).to eq "bar"
    end

    it "adds the owner as a group member" do
      post "/v1/groups", new_params, auth_header
      expect(Group.last.members).to include current_user
    end

    it "adds an group image" do
      post "/v1/groups", new_params.merge(image: { publicId: 'foobar' }),
           auth_header
      expect(json["image"]).to eq "foobar"
    end

    context "invite multiple members on group creation" do
      let(:new_params) do
        { name: "bar",
          invitees: create_list(:user, 3).collect(&:id) }
      end

      it "creates memberships for all invitees" do
        expect {
          post "/v1/groups", new_params, auth_header
        }.to change(Membership, :count).by 4
        expect(Membership.last.invited?).to be true
      end
    end
  end

  # update
  describe "PATCH /v1/groups/:group_id" do
    let(:new_params) { { name: "bar" } }

    describe "user is group owner" do
      let(:group) { create(:group, owner: current_user, name: "foo") }

      it "returns OK" do
        patch "/v1/groups/#{group.id}", new_params, auth_header
        expect(response.status).to be(200)
      end

      it "updates group name" do
        patch "/v1/groups/#{group.id}", new_params, auth_header
        group.reload
        expect(group.name).to eq "bar"
      end

      describe "add image" do
        let(:public_id) { attributes_for(:real_image)[:public_id] }
        let(:img_params) { { image: { publicId: public_id } } }

        describe "new" do
          it "returns OK" do
            patch "/v1/groups/#{group.id}", img_params, auth_header
            expect(response.status).to be(200)
          end

          it "sets group image" do
            patch "/v1/groups/#{group.id}", img_params, auth_header
            expect(group.image.public_id).to eq public_id
          end
        end

        describe "overwrite existing" do
          let(:group) {
            create(:group, :with_image, owner: current_user, name: "foo")
          }
          it "returns OK" do
            patch "/v1/groups/#{group.id}", img_params, auth_header
            expect(response.status).to be(200)
            expect(group.image.public_id).to eq public_id
          end
        end

        describe "invalid" do
          let(:img_params) { { image: { public_id: nil } } }

          it "returns 422" do
            patch "/v1/groups/#{group.id}", img_params, auth_header
            expect(response.status).to be(422)
          end

          it "doesn't set group image" do
            expect {
              patch "/v1/groups/#{group.id}", img_params, auth_header
            }.not_to change(group, :image)
          end
        end
      end
    end

    describe "user not group owner" do
      let(:group) { create(:group, name: "foo") }

      it "returns Unauthorized" do
        patch "/v1/groups/#{group.id}", new_params, auth_header
        expect(response.status).to be(401)
      end

      it "doesn't change group name" do
        expect {
          patch "/v1/groups/#{group.id}", new_params, auth_header
        }.not_to change(group, :name)
      end
    end
  end

  # delete
  describe "DELETE /v1/groups/:group_id" do
    let(:group) { create(:group, owner: current_user) }

    it "deletes the group" do
      delete "/v1/groups/#{group.id}", {}, auth_header
      group.reload
      expect(group.deleted_at?).to be true
    end

    context "group image" do
      let(:group) {
        create(:group, :with_image, owner: current_user) }

      it "deletes group image" do
        group_image = group.image
        delete "/v1/groups/#{group.id}", {}, auth_header
        group_image.reload
        expect(group_image.deleted_at?).to be true
      end
    end

    context "memberships" do
      let(:group) { create(:group, :with_3_members, owner: current_user) }

      it "deletes all memberships" do
        group_memberships = group.memberships
        delete "/v1/groups/#{group.id}", {}, auth_header
        group_memberships.reload
        expect(group_memberships.first.deleted_at?).to be true
        expect(group_memberships.last.deleted_at?).to be true
      end
    end

    context "group_slots" do
      let!(:group_slots) { create_list(:group_slot, 3, group: group) }

      it "deletes all group slots" do
        g_slots = group.group_slots
        delete "/v1/groups/#{group.id}", {}, auth_header
        g_slots.reload
        expect(g_slots.first.deleted_at?).to be true
        expect(g_slots.last.deleted_at?).to be true
      end

      it "deletes the metaslot of the group slots if no other reference" do
        group_metaslot = group.group_slots.first.meta_slot
        delete "/v1/groups/#{group.id}", {}, auth_header
        group_metaslot.reload
        expect(group_metaslot.deleted_at?).to be true
      end
    end

    context "group_slots media" do
      let!(:group_slots) {
        create_list(:group_slot, 3, :with_media, group: group) }

      it "deletes all photos on the group slots" do
        g_slots_img_first = group.group_slots.first.photos.first
        g_slots_img_last = group.group_slots.first.photos.last
        delete "/v1/groups/#{group.id}", {}, auth_header
        g_slots_img_first.reload
        g_slots_img_last.reload
        expect(g_slots_img_first.deleted_at?).to be true
        expect(g_slots_img_last.deleted_at?).to be true
      end
    end

    context "group_slots notes" do
      let!(:group_slots) {
        create_list(:group_slot, 3, :with_notes, group: group) }

      it "deletes all notes on the group slots" do
        g_slots_note_first = group.group_slots.first.notes.first
        g_slots_note_last = group.group_slots.first.notes.last
        delete "/v1/groups/#{group.id}", {}, auth_header
        g_slots_note_first.reload
        g_slots_note_last.reload
        expect(g_slots_note_first.deleted_at?).to be true
        expect(g_slots_note_last.deleted_at?).to be true
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
        post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
        expect(response.status).to be(201)
      end

      it "returns a list of all users related to that group" do
        post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
        expect(json).to have_key "related"
        # group owner is automatically an active member too
        expect(json['related'].size).to eq 6
      end

      it "creates new memberships with state 'invited' for all new members" do
        expect {
          post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
        }.to change(Membership, :count).by(other_users.size)
        other_users.each do |id|
          expect(Membership.where(user_id: id).first.invited?).to be true
        end
      end

      it "doesn't create new memberships for already invited members" do
        create(:membership, :invited, user: other_users.first, group: group)

        expect {
          post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
        }.to change(Membership, :count).by(other_users.size - 1)
      end

      it "doesn't create new memberships for already active members" do
        create(:membership, :active, user: other_users.first, group: group)

        expect {
          post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
        }.to change(Membership, :count).by(other_users.size - 1)
      end

      it "re-invites users who had left the group or rejected a previous invitation" do
        create(:membership, :left, user: other_users.first, group: group)
        create(:membership, :refused, user: other_users.last, group: group)

        expect {
          post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
        }.to change(Membership, :count).by(other_users.size - 2)
        membership1 = Membership.where(user_id: other_users.first).first
        membership2 = Membership.where(user_id: other_users.last).first
        expect(membership1.invited?).to be true
        expect(membership2.invited?).to be true
      end

      it "doesn't add user to group" do
        expect {
          post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
        }.not_to change(group.members, :count)
      end

      describe "existing membership" do
        describe "duplicate invitation" do
          let!(:membership) {
            create(:membership, user: other_users.first, group: group)
          }
          it "returns ok" do
            post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
            expect(response.status).to be(201)
          end

          it "are not (re-)created " do
            expect {
              post "/v1/groups/#{group.id}/members", { invitees: [ids.first] },
                   auth_header
            }.not_to change(Membership, :count)
          end
        end

        describe "active group member" do
          let!(:membership) {
            create(:membership, :active, user: other_users.first, group: group)
          }
          it "returns OK" do
            post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
            expect(response.status).to be(201)
          end
        end

        describe "non active group member" do
          let!(:membership) {
            create(:membership, :left, user: other_users.first, group: group)
          }
          it "returns Created" do
            post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
            expect(response.status).to be(201)
          end

          it "memberships are not (re-)created " do
            expect {
              post "/v1/groups/#{group.id}/members", { invitees: [ids.first] },
                   auth_header
            }.not_to change(Membership, :count)
          end

          it "changes membership state to 'invited'" do
            post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
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

      it "returns Unauthorized" do
        post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
        expect(response.status).to be 401
      end

      it "doesn't create membership" do
        expect {
          post "/v1/groups/#{group.id}/members", { invitees: ids }, auth_header
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
        post "/v1/groups/#{group.id}/accept", {}, auth_header
        expect(response.status).to be(200)
      end

      it "changes membership state to active" do
        post "/v1/groups/#{group.id}/accept", {}, auth_header
        membership.reload
        expect(membership.active?).to be true
      end

      it "adds user to group" do
        expect {
          post "/v1/groups/#{group.id}/accept", {}, auth_header
        }.to change(group.members, :count).by(1)
      end
    end

    describe "no invitation" do
      let!(:membership) do
        create(:membership, :inactive, user: current_user, group: group)
      end

      it "returns Unauthorized" do
        post "/v1/groups/#{group.id}/accept", {}, auth_header
        expect(response.status).to be 401
      end

      it "doesn't changes membership state" do
        expect {
          post "/v1/groups/#{group.id}/accept", {}, auth_header
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      let(:membership) {}

      it "returns Unauthorized" do
        post "/v1/groups/#{group.id}/accept", {}, auth_header
        expect(response.status).to be 401
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
        post "/v1/groups/#{group.id}/refuse", {}, auth_header
        expect(response.status).to be(200)
      end

      it "changes membership state to refused" do
        post "/v1/groups/#{group.id}/refuse", {}, auth_header
        membership.reload
        expect(membership.refused?).to be true
      end
    end

    describe "no invitation" do
      let!(:membership) do
        create(:membership, :inactive, user: current_user, group: group)
      end

      it "returns Unauthorized" do
        post "/v1/groups/#{group.id}/refuse", {}, auth_header
        expect(response.status).to be 401
      end

      it "doesn't changes membership state" do
        expect {
          post "/v1/groups/#{group.id}/refuse", {}, auth_header
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      let(:membership) {}

      it "returns Unauthorized" do
        post "/v1/groups/#{group.id}/refuse", {}, auth_header
        expect(response.status).to be 401
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
        delete "/v1/groups/#{group.id}/members", {}, auth_header
        expect(response.status).to be(200)
      end

      it "changes membership state to 'left'" do
        delete "/v1/groups/#{group.id}/members", {}, auth_header
        membership.reload
        expect(membership.left?).to be true
      end
    end

    describe "group already left" do
      let!(:membership) do
        create(:membership, :left, user: current_user, group: group)
      end

      it "returns Not Authorized" do
        delete "/v1/groups/#{group.id}/members", {}, auth_header
        expect(response.status).to be 401
      end

      it "doesn't changes membership state" do
        expect {
          delete "/v1/groups/#{group.id}/members", {}, auth_header
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      it "returns Unauthorized" do
        delete "/v1/groups/#{group.id}/members", {}, auth_header
        expect(response.status).to be(401)
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
          delete "/v1/groups/#{group.id}/members/#{member.id}", {}, auth_header
          expect(response.status).to be(200)
        end

        it "changes membership state to 'kicked'" do
          delete "/v1/groups/#{group.id}/members/#{member.id}", {}, auth_header
          membership.reload
          expect(membership.kicked?).to be true
        end
      end

      describe "membership invited" do
        let!(:membership) do
          create(:membership, :invited, user: member, group: group)
        end

        it "returns OK" do
          delete "/v1/groups/#{group.id}/members/#{member.id}", {}, auth_header
          expect(response.status).to be(200)
        end

        it "changes membership state to 'kicked'" do
          delete "/v1/groups/#{group.id}/members/#{member.id}", {}, auth_header
          membership.reload
          expect(membership.kicked?).to be true
        end
      end

      describe "membership not active nor invited" do
        let!(:membership) do
          create(:membership, :inactive, user: member, group: group)
        end

        it "returns OK" do
          delete "/v1/groups/#{group.id}/members/#{member.id}", {}, auth_header
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

      it "returns Unauthorized" do
        delete "/v1/groups/#{group.id}/members/#{member.id}", {}, auth_header
        expect(response.status).to be(401)
      end

      it "doesn't changes membership state" do
        expect {
          delete "/v1/groups/#{group.id}/members/#{member.id}", {}, auth_header
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      it "returns Unprocessable Entity" do
        delete "/v1/groups/#{group.id}/members/#{member.id}", {}, auth_header
        expect(response.status).to be 422
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
          patch "/v1/groups/#{group.id}/members", params, auth_header
          expect(response.status).to be(200)
        end

        it "changes notifications state" do
          patch "/v1/groups/#{group.id}/members", params, auth_header
          membership.reload
          expect(membership.notifications).to be false
        end
      end

      describe "membership not active" do
        let!(:membership) do
          create(:membership, :left, user: current_user, group: group,
                 notifications: true)
        end

        it "returns Unauthorized" do
          patch "/v1/groups/#{group.id}/members", params, auth_header
          expect(response).to have_http_status :unauthorized
        end

        it "doesn't change notifications state" do
          expect {
            patch "/v1/groups/#{group.id}/members", params, auth_header
          }.not_to change(membership, :notifications)
        end
      end
    end

    describe "current user not group member" do
      it "returns Unauthorized" do
        patch "/v1/groups/#{group.id}/members", params, auth_header
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
