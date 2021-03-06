require 'rails_helper'

RSpec.describe "V1::Groups", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  # create
  describe "POST /v1/groups" do
    let(:new_params) { { name: "bar" } }

    it "returns 201 created" do
      post "/v1/groups", new_params, auth_header
      expect(response).to have_http_status :created
    end

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
      post "/v1/groups", new_params.merge(image: 'foobar'),
           auth_header
      expect(json["image"]).to eq "foobar"
    end

    context "invite multiple members on group creation" do
      let(:new_params) do
        { name: "bar",
          invitees: create_list(:user, 3).collect(&:id) }
      end

      it "creates active memberships for all invitees" do
        expect {
          post "/v1/groups", new_params, auth_header
        }.to change(Membership, :count).by 4
        expect(Membership.last.active?).to be true
      end
    end

    context "non-public group/calendar" do
      it "members are allowed to add content" do
        post "/v1/groups", new_params, auth_header
        expect(Group.last.members_can_post).to be true
      end

      it "only owner can add new members" do
        post "/v1/groups", new_params, auth_header
        expect(Group.last.members_can_invite).to be false
      end
    end

    context "public group/calendar" do
      let(:new_params) { { name: "public bar", public: true } }

      it "members are not allowed to add content" do
        post "/v1/groups", new_params, auth_header
        expect(Group.last.members_can_post).to be false
      end

      it "strangers are allowed to subscribe" do
        post "/v1/groups", new_params, auth_header
        expect(Group.last.members_can_invite).to be true
      end
    end
  end

  # update
  describe "PATCH /v1/groups/:group_uuid" do
    let(:new_params) { { name: "bar" } }

    describe "user is group owner" do
      let(:group) { create(:group, owner: current_user, name: "foo") }

      it "returns OK" do
        patch "/v1/groups/#{group.uuid}", new_params, auth_header
        expect(response.status).to be(200)
      end

      it "updates group name" do
        patch "/v1/groups/#{group.uuid}", new_params, auth_header
        group.reload
        expect(group.name).to eq "bar"
      end

      describe "add image" do
        let(:img_params) { { image: 'foobar' } }

        describe "new" do
          it "returns OK" do
            patch "/v1/groups/#{group.uuid}", img_params, auth_header
            expect(response.status).to be(200)
          end

          it "sets group image" do
            patch "/v1/groups/#{group.uuid}", img_params, auth_header
            group.reload
            expect(group.image).to eq 'foobar'
          end
        end

        describe "overwrite existing" do
          let(:group) { create(:group, :with_image, owner: current_user) }

          it "sets the new image" do
            expect(group.image).to eq 'sample'

            patch "/v1/groups/#{group.uuid}", img_params, auth_header

            group.reload
            expect(response.status).to be(200)
            expect(group.image).to eq 'foobar'
          end
        end

        describe "invalid" do
          let(:img_params) { { image: nil } }
          # it's 422 because the database doesn't allow nil values for image
          # consider checking for nil on application level

          it "returns 422" do
            patch "/v1/groups/#{group.uuid}", img_params, auth_header
            expect(response.status).to be(422)
          end

          it "doesn't set group image" do
            expect {
              patch "/v1/groups/#{group.uuid}", img_params, auth_header
            }.not_to change(group, :image)
          end
        end
      end
    end

    describe "user not group owner" do
      let(:group) { create(:group, name: "foo") }

      it "returns Forbidden" do
        patch "/v1/groups/#{group.uuid}", new_params, auth_header
        expect(response).to have_http_status :forbidden
      end

      it "doesn't change group name" do
        expect {
          patch "/v1/groups/#{group.uuid}", new_params, auth_header
        }.not_to change(group, :name)
      end
    end
  end

  # delete
  describe "DELETE /v1/groups/:group_uuid" do
    let(:group) { create(:group, owner: current_user) }

    it "deletes the group" do
      delete "/v1/groups/#{group.uuid}", {}, auth_header
      group.reload
      expect(group.deleted_at?).to be true
    end

    context "memberships" do
      let(:group) { create(:group, :with_3_members, owner: current_user) }

      it "deletes all memberships" do
        group_memberships = group.memberships
        delete "/v1/groups/#{group.uuid}", {}, auth_header
        group_memberships.reload
        expect(group_memberships.first.deleted_at?).to be true
        expect(group_memberships.last.deleted_at?).to be true
      end
    end

    context "slots in calendar" do
      let(:group) {
        create(:calendar, :with_3_slots, owner: current_user)
      }
      let!(:slot_in_schedule) {
        create(:passengership, slot: group.slots.first, user: current_user,
               show_in_my_schedule: true)
      }
      let!(:slot_in_schedule_and_other_calendar) {
        shown_calendar = create(:calendar)
        create(:membership, :show_in_schedule, user: current_user,
               group: shown_calendar)
        create(:containership, slot: group.slots.last, group: shown_calendar)
        create(:passengership, slot: group.slots.last, user: current_user,
               show_in_my_schedule: true)
      }

      it "hides the calendar slots from the users schedule" do
        delete "/v1/groups/#{group.uuid}", {}, auth_header

        slot_in_schedule.reload
        expect(slot_in_schedule.show_in_my_schedule).to be false

        slot_in_schedule_and_other_calendar.reload
        expect(
          slot_in_schedule_and_other_calendar.show_in_my_schedule
        ).to be true
      end

      it "hides the calendar slots from schedule if explicitly stated" do
        delete "/v1/groups/#{group.uuid}",
               { keepSlotsInSchedule: '0' }, auth_header

        slot_in_schedule.reload
        expect(slot_in_schedule.show_in_my_schedule).to be false

        slot_in_schedule_and_other_calendar.reload
        expect(
          slot_in_schedule_and_other_calendar.show_in_my_schedule
        ).to be true
      end

      it "keeps the calendar slots in schedule if explicitly stated" do
        delete "/v1/groups/#{group.uuid}",
               { keepSlotsInSchedule: '1' }, auth_header

        slot_in_schedule.reload
        expect(slot_in_schedule.show_in_my_schedule).to be true

        slot_in_schedule_and_other_calendar.reload
        expect(
          slot_in_schedule_and_other_calendar.show_in_my_schedule
        ).to be true
      end
    end

    # context "group_slots" do
    #   let!(:group_slots) { create_list(:group_slot, 3, group: group) }

    #   it "deletes all group slots" do
    #     g_slots = group.group_slots
    #     delete "/v1/groups/#{group.uuid}", {}, auth_header
    #     g_slots.reload
    #     expect(g_slots.first.deleted_at?).to be true
    #     expect(g_slots.last.deleted_at?).to be true
    #   end

    #   it "deletes the metaslot of the group slots if no other reference" do
    #     group_metaslot = group.group_slots.first.meta_slot
    #     delete "/v1/groups/#{group.uuid}", {}, auth_header
    #     group_metaslot.reload
    #     expect(group_metaslot.deleted_at?).to be true
    #   end
    # end

    # context "group_slots media" do
    #   let!(:group_slots) {
    #     create_list(:group_slot, 3, :with_media, group: group) }

    #   it "deletes all images on the group slots" do
    #     g_slots_img_first = group.group_slots.first.images.first
    #     g_slots_img_last = group.group_slots.first.images.last
    #     delete "/v1/groups/#{group.uuid}", {}, auth_header
    #     g_slots_img_first.reload
    #     g_slots_img_last.reload
    #     expect(g_slots_img_first.deleted_at?).to be true
    #     expect(g_slots_img_last.deleted_at?).to be true
    #   end
    # end

    # context "group_slots notes" do
    #   let!(:group_slots) {
    #     create_list(:group_slot, 3, :with_notes, group: group) }

    #   it "deletes all notes on the group slots" do
    #     g_slots_note_first = group.group_slots.first.notes.first
    #     g_slots_note_last = group.group_slots.first.notes.last
    #     delete "/v1/groups/#{group.uuid}", {}, auth_header
    #     g_slots_note_first.reload
    #     g_slots_note_last.reload
    #     expect(g_slots_note_first.deleted_at?).to be true
    #     expect(g_slots_note_last.deleted_at?).to be true
    #   end
    # end
  end

  # invite
  describe "POST /v1/groups/:group_uuid/members" do
    let(:other_users) { create_list(:user, 5) }
    let(:ids) { other_users.collect(&:id) }

    describe "user can invite" do
      let!(:group) { create(:group, owner: current_user, default_color: '888FFF') }

      it "returns created" do
        post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        expect(response.status).to be(201)
      end

      it "returns a list of all users related to that group" do
        post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        expect(json).to have_key "related"
        # group owner is automatically an active member too
        expect(json['related'].size).to eq 6
      end

      it "creates new memberships with state 'active' for all new members" do
        expect {
          post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        }.to change(Membership, :count).by(other_users.size)
        other_users.each do |id|
          expect(Membership.where(user_id: id).first.active?).to be true
        end
      end

      it "sets the group color for the new member to the groups default color" do
        post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        expect(Membership.last.color).to eq group.default_color
        expect(Membership.first.color).to eq group.default_color # owner
      end

      it "doesn't create new memberships for already invited members" do
        create(:membership, :invited, user: other_users.first, group: group)

        expect {
          post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        }.to change(Membership, :count).by(other_users.size - 1)
      end

      it "doesn't create new memberships for already active members" do
        create(:membership, :active, user: other_users.first, group: group)

        expect {
          post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        }.to change(Membership, :count).by(other_users.size - 1)
      end

      it "re-adds users who had left the group" do
        create(:membership, :left, user: other_users.first, group: group)
        create(:membership, :refused, user: other_users.last, group: group)

        expect {
          post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        }.to change(Membership, :count).by(other_users.size - 2)
        membership1 = Membership.where(user_id: other_users.first).first
        membership2 = Membership.where(user_id: other_users.last).first
        expect(membership1.active?).to be true
        expect(membership2.active?).to be true
      end

      it "adds user to group" do
        expect {
          post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        }.to change(group.members, :count).by 5
      end

      describe "existing membership" do
        describe "duplicate invitation" do
          let!(:membership) {
            create(:membership, user: other_users.first, group: group)
          }
          it "returns ok" do
            post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
            expect(response.status).to be(201)
          end

          it "are not (re-)created " do
            expect {
              post "/v1/groups/#{group.uuid}/members", { invitees: [ids.first] },
                   auth_header
            }.not_to change(Membership, :count)
          end
        end

        describe "active group member" do
          let!(:membership) {
            create(:membership, :active, user: other_users.first, group: group)
          }
          it "returns OK" do
            post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
            expect(response.status).to be(201)
          end
        end

        describe "non active group member" do
          let!(:membership) {
            create(:membership, :left, user: other_users.first, group: group)
          }
          it "returns Created" do
            post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
            expect(response.status).to be(201)
          end

          it "memberships are not (re-)created " do
            expect {
              post "/v1/groups/#{group.uuid}/members", { invitees: [ids.first] },
                   auth_header
            }.not_to change(Membership, :count)
          end

          it "changes membership state to 'active'" do
            post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
            membership.reload
            expect(membership.active?).to be true
          end
        end
      end
    end

    describe "user can't invite" do
      let!(:group) do
        create(:group, owner: create(:user), members_can_invite: false)
      end

      it "returns Forbidden" do
        post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        expect(response).to have_http_status :forbidden
      end

      it "doesn't create membership" do
        expect {
          post "/v1/groups/#{group.uuid}/members", { invitees: ids }, auth_header
        }.not_to change(Membership, :count)
      end
    end
  end

  # accept_invite
  describe "POST /v1/groups/:group_uuid/accept" do
    let(:group) { create(:group) }
    let!(:membership) do
      create(:membership, :invited, user: current_user, group: group)
    end

    describe "existing invitation" do
      it "returns success" do
        post "/v1/groups/#{group.uuid}/accept", {}, auth_header
        expect(response.status).to be(200)
      end

      it "changes membership state to active" do
        post "/v1/groups/#{group.uuid}/accept", {}, auth_header
        membership.reload
        expect(membership.active?).to be true
      end

      it "adds user to group" do
        expect {
          post "/v1/groups/#{group.uuid}/accept", {}, auth_header
        }.to change(group.members, :count).by(1)
      end
    end

    describe "no invitation" do
      let!(:membership) do
        create(:membership, :inactive, user: current_user, group: group)
      end

      it "returns Forbidden" do
        post "/v1/groups/#{group.uuid}/accept", {}, auth_header
        expect(response).to have_http_status :forbidden
      end

      it "doesn't changes membership state" do
        expect {
          post "/v1/groups/#{group.uuid}/accept", {}, auth_header
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      let(:membership) {}

      it "returns Forbidden" do
        post "/v1/groups/#{group.uuid}/accept", {}, auth_header
        expect(response).to have_http_status :forbidden
      end
    end
  end

  # refuse_invite
  describe "POST /v1/groups/:group_uuid/refuse" do
    let(:group) { create(:group) }
    let!(:membership) do
      create(:membership, :invited, user: current_user, group: group)
    end

    describe "existing invitation" do
      let(:params) { { group: { invite: 'refuse' } } }

      it "returns success" do
        post "/v1/groups/#{group.uuid}/refuse", {}, auth_header
        expect(response.status).to be(200)
      end

      it "changes membership state to refused" do
        post "/v1/groups/#{group.uuid}/refuse", {}, auth_header
        membership.reload
        expect(membership.refused?).to be true
      end
    end

    describe "no invitation" do
      let!(:membership) do
        create(:membership, :inactive, user: current_user, group: group)
      end

      it "returns Forbidden" do
        post "/v1/groups/#{group.uuid}/refuse", {}, auth_header
        expect(response).to have_http_status :forbidden
      end

      it "doesn't changes membership state" do
        expect {
          post "/v1/groups/#{group.uuid}/refuse", {}, auth_header
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      let(:membership) {}

      it "returns Forbidden" do
        post "/v1/groups/#{group.uuid}/refuse", {}, auth_header
        expect(response).to have_http_status :forbidden
      end
    end
  end

  # leave
  describe "DELETE /v1/groups/:group_uuid/members" do
    let(:group) { create(:group, owner: create(:user)) }

    describe "membership active" do
      let!(:membership) do
        create(:membership, :active, user: current_user, group: group)
      end

      it "returns OK" do
        delete "/v1/groups/#{group.uuid}/members", {}, auth_header
        expect(response.status).to be(200)
      end

      it "changes membership state to 'left'" do
        delete "/v1/groups/#{group.uuid}/members", {}, auth_header
        membership.reload
        expect(membership.left?).to be true
      end

      context "slots in calendar" do
        let(:group) {
          create(:calendar, :with_3_slots, owner: create(:user))
        }
        let!(:slot_in_schedule) {
          create(:passengership, slot: group.slots.first, user: current_user,
                 show_in_my_schedule: true)
        }
        let!(:slot_in_schedule_and_other_calendar) {
          shown_calendar = create(:calendar)
          create(:membership, :show_in_schedule, user: current_user,
                 group: shown_calendar)
          create(:containership, slot: group.slots.last, group: shown_calendar)
          create(:passengership, slot: group.slots.last, user: current_user,
                 show_in_my_schedule: true)
        }

        it "hides the calendar slots from the users schedule" do
          delete "/v1/groups/#{group.uuid}/members", {}, auth_header

          slot_in_schedule.reload
          expect(slot_in_schedule.show_in_my_schedule).to be false

          slot_in_schedule_and_other_calendar.reload
          expect(
            slot_in_schedule_and_other_calendar.show_in_my_schedule
          ).to be true
        end

        it "hides the calendar slots from schedule if explicitly stated" do
          delete "/v1/groups/#{group.uuid}/members",
                 { keepSlotsInSchedule: '0' }, auth_header

          slot_in_schedule.reload
          expect(slot_in_schedule.show_in_my_schedule).to be false

          slot_in_schedule_and_other_calendar.reload
          expect(
            slot_in_schedule_and_other_calendar.show_in_my_schedule
          ).to be true
        end

        it "keeps the calendar slots in schedule if explicitly stated" do
          delete "/v1/groups/#{group.uuid}/members",
                 { keepSlotsInSchedule: '1' }, auth_header

          slot_in_schedule.reload
          expect(slot_in_schedule.show_in_my_schedule).to be true

          slot_in_schedule_and_other_calendar.reload
          expect(
            slot_in_schedule_and_other_calendar.show_in_my_schedule
          ).to be true
        end
      end
    end

    describe "group already left" do
      let!(:membership) do
        create(:membership, :left, user: current_user, group: group)
      end

      it "returns Forbidden" do
        delete "/v1/groups/#{group.uuid}/members", {}, auth_header
        expect(response).to have_http_status :forbidden
      end

      it "doesn't changes membership state" do
        expect {
          delete "/v1/groups/#{group.uuid}/members", {}, auth_header
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      it "returns Forbidden" do
        delete "/v1/groups/#{group.uuid}/members", {}, auth_header
        expect(response).to have_http_status :forbidden
      end
    end
  end

  # kick
  describe "DELETE /v1/groups/:group_uuid/members/:user_id" do
    let(:member) { create(:user) }
    let(:group) { create(:group, owner: current_user) }

    describe "current user is group owner" do
      describe "membership active" do
        let!(:membership) do
          create(:membership, :active, user: member, group: group)
        end

        it "returns OK" do
          delete "/v1/groups/#{group.uuid}/members/#{member.id}", {}, auth_header
          expect(response.status).to be(200)
        end

        it "changes membership state to 'kicked'" do
          delete "/v1/groups/#{group.uuid}/members/#{member.id}", {}, auth_header
          membership.reload
          expect(membership.kicked?).to be true
        end
      end

      describe "membership invited" do
        let!(:membership) do
          create(:membership, :invited, user: member, group: group)
        end

        it "returns OK" do
          delete "/v1/groups/#{group.uuid}/members/#{member.id}", {}, auth_header
          expect(response.status).to be(200)
        end

        it "changes membership state to 'kicked'" do
          delete "/v1/groups/#{group.uuid}/members/#{member.id}", {}, auth_header
          membership.reload
          expect(membership.kicked?).to be true
        end
      end

      describe "membership not active nor invited" do
        let!(:membership) do
          create(:membership, :inactive, user: member, group: group)
        end

        it "returns OK" do
          delete "/v1/groups/#{group.uuid}/members/#{member.id}", {}, auth_header
          expect(response.status).to be(200)
        end

        it "doesn't changes membership state" do
          expect {
            delete "/v1/groups/#{group.uuid}/members/#{member.id}"
          }.not_to change(membership, :state)
        end
      end
    end

    describe "current user not group owner" do
      let(:group) { create(:group, owner: create(:user)) }
      let!(:membership) do
        create(:membership, :active, user: member, group: group)
      end

      it "returns Forbidden" do
        delete "/v1/groups/#{group.uuid}/members/#{member.id}", {}, auth_header
        expect(response).to have_http_status :forbidden
      end

      it "doesn't changes membership state" do
        expect {
          delete "/v1/groups/#{group.uuid}/members/#{member.id}", {}, auth_header
        }.not_to change(membership, :state)
      end
    end

    describe "no membership" do
      it "returns OK" do
        delete "/v1/groups/#{group.uuid}/members/#{member.id}", {}, auth_header
        expect(response.status).to be 200
      end
    end
  end

  # settings
  describe "PATCH /v1/groups/:group_uuid/members" do
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
          patch "/v1/groups/#{group.uuid}/members", params, auth_header
          expect(response.status).to be(200)
        end

        it "changes notifications state" do
          patch "/v1/groups/#{group.uuid}/members", params, auth_header
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
          patch "/v1/groups/#{group.uuid}/members", params, auth_header
          expect(response).to have_http_status :forbidden
        end

        it "doesn't change notifications state" do
          expect {
            patch "/v1/groups/#{group.uuid}/members", params, auth_header
          }.not_to change(membership, :notifications)
        end
      end
    end

    describe "current user not group member" do
      it "returns Forbidden" do
        patch "/v1/groups/#{group.uuid}/members", params, auth_header
        expect(response).to have_http_status :forbidden
      end
    end
  end

  # global slot groups
  describe "POST /v1/groups/global_group", :seed do
    let(:group) { attributes_for(:group, :global) }
    let(:string_id) { "soccer_leagues:dfb.de:champions_league" }
    let(:params) { { muid: group.uuid, name: 'Rephlex', string_id: string_id } }
    # let(:image) { "http://faster.pussycat" }
    let(:current_user) { User.find_by email: 'global-importer@timeslot.com' }
    let(:category_user) { create(:user, :gs_category) }

    describe "existing public group with different name" do
      let(:group) { create(:group, :global) }

      it "uptdates group name if non-matching group name" do
        post "/v1/groups/global_group",
             { group: params },
             auth_header
        expect(response).to have_http_status :ok
        group.reload
        expect(group.name).to eq 'Rephlex'
      end
    end

    describe "existing global slot" do
      let!(:global_slot) { create(:global_slot) }
      let(:params) do
        { category_uuid: category_user[:user_uuid],
          group: { muid: group[:uuid],
                   string_id: string_id,
                   name: 'Rephlex',
                   slots: [global_slot.slot_uuid] } }
      end

      it "adds the slot to the group" do
        post "/v1/groups/global_group", params, auth_header

        expect(response).to have_http_status :ok
        expect(Group.last.slots).to include global_slot
      end
    end

    describe "no existing global slot, but existing location", :vcr do
      let(:slots) { [attributes_for(:global_slot)[:slot_uuid]] }
      let!(:location) { create(:pier_2_bremen) }
      let(:params) do
        { category_uuid: category_user[:user_uuid],
          group: { muid: group[:uuid],
                   string_id: string_id,
                   name: 'Rephlex',
                   slots: slots } }
      end

      it "creates a new group" do
        expect {
          post "/v1/groups/global_group", params, auth_header
        }.to change(Group, :count)
      end

      it "creates a new globalslot" do
        expect {
          post "/v1/groups/global_group", params, auth_header
        }.to change(GlobalSlot, :count)
      end

      it "adds the slot to the group" do
        post "/v1/groups/global_group", params, auth_header
        expect(response).to have_http_status :ok
        expect(Group.last.slots).to include GlobalSlot.last
      end

      it "doesn't create a new location" do
        expect {
          post "/v1/groups/global_group", params, auth_header
        }.not_to change(IosLocation, :count)
      end
    end

    describe "global slot already in group" do
      let(:group) { create(:group, :global, owner: category_user) }
      let(:global_slot) { create(:global_slot) }
      let!(:containership) {
        create(:containership, slot: global_slot, group: group) }
      let(:params) do
        { category_uuid: category_user[:user_uuid],
          group: { muid: group[:uuid],
                   string_id: string_id,
                   name: group.name,
                   slots: [global_slot.slot_uuid] } }
      end

      it "adds the slot to the group" do
        expect(Group.last.slots).to include global_slot
        post "/v1/groups/global_group", params, auth_header
        expect(response).to have_http_status :ok
        expect(Group.last.slots).to include global_slot
      end

      it "doesn't create a new group" do
        expect {
          post "/v1/groups/global_group", params, auth_header
        }.not_to change(Group, :count)
      end
    end
  end
end
