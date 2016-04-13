require 'documentation_helper'

resource "GlobalSlots" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password, :with_device) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  post "/v1/globalslots/reslot", :vcr do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :predecessor, "'muid' of the global slot", required: true
    parameter :slotSets,
              "Array with UUIDs of the SlotGroups and SlotSets the slot " \
              "should be added to",
              required: false

    let(:predecessor) { attributes_for(:global_slot)[:slot_uuid] }

    example "Reslot global slot", document: :v1 do
      explanation "Send the **muid** of the Global Slot to reslot it.\n\n " \
                  "Backend retrieves slot data from data team.\n\n" \
                  "returns 404 if no global slot can be found for given uuid"
      do_request

      expect(response_status).to eq 201
      expect(json).to have_key("muid")
      expect(json['muid']).to eq predecessor
      expect(json).to have_key("visibility")
      expect(json['visibility']).to eq 'public'
      expect(json).to have_key("creator")
      expect(json['creator']['image']).not_to be_nil
    end
  end
end
