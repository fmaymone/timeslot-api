require 'documentation_helper'

resource "GlobalSlots" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password, :with_device) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  post "/v1/globalslots/reslot", :vcr do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :predecessor, "'muid' of the global slot", required: true
    parameter :slotGroups,
              "Array with UUIDs of the SlotGroups the slot " \
              "should be added to",
              required: true

    let(:predecessor) { attributes_for(:global_slot)[:slot_uuid] }

    # additional slotgroups
    let(:group_1) { create(:group, owner: current_user) }
    let(:group_2) do
      group = create(:group)
      create(:membership, :active, group: group, user: current_user)
      group
    end
    let(:unauthorized_group) { create(:group) }
    let(:deleted_group) { create(:group, owner: current_user,
                                 deleted_at: '2014-09-08T13:31:02.000Z') }

    let(:slotGroups) { [current_user.my_cal_uuid,
                        group_1.uuid,
                        group_2.uuid,
                        unauthorized_group.uuid,
                        deleted_group.uuid] }

    example "Reslot global slot", document: :v1 do
      explanation "Send the **muid** of the Global Slot and at least one " \
                  " valid SlotGroup/Calendar UUID where the slot should be " \
                  " added to.\n\n " \
                  "Backend retrieves slot data from data team.\n\n" \
                  "Returns data of new slot and array with unauthorized " \
                  "slotGroup UUIDs (User has no write access or slotgroup" \
                  " deleted).\n\n" \
                  "Returns 404 if no global slot can be found for given uuid."

      do_request

      expect(response_status).to eq 201
      expect(json).to have_key("id")
      expect(json).to have_key("muid")
      expect(json['muid']).to eq predecessor
      expect(json).to have_key("visibility")
      expect(json['visibility']).to eq 'public'
      expect(json).to have_key("creator")
      expect(json['creator']['image']).not_to be_nil
      expect(json).to have_key("unauthorizedSlotgroups")
      expect(json['unauthorizedSlotgroups']).not_to be_nil
      expect(json['unauthorizedSlotgroups']).to include unauthorized_group.uuid
      expect(json['unauthorizedSlotgroups']).to include deleted_group.uuid

      new_slot = BaseSlot.find(json['id'])
      expect(group_1.slots).to include new_slot
      expect(group_2.slots).to include new_slot
      expect(current_user.my_calendar_slots).to include new_slot
    end
  end
end
