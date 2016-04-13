require 'rails_helper'

RSpec.describe "V1::GlobalSlots", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "POST /v1/globalslots/reslot" do
    let!(:current_user) { create(:user, :with_email, :with_password) }

    context "global slot not in backend db" do
      let(:gs_data) { attributes_for(:global_slot) }
      let(:gs_no_description_data) {
        attributes_for(:global_slot, :without_description) }
      let(:slot_group) { create(:group, owner: current_user) }
      let(:raw_global_slot) { CandyShop.new.slot(gs_data[:slot_uuid]) }

      it "returns 201", :vcr do
        post "/v1/globalslots/reslot",
             { predecessor: gs_data[:slot_uuid] },
             auth_header
        expect(response).to have_http_status :created
      end

      it "creates a new slot", :vcr do
        expect {
          post "/v1/globalslots/reslot",
               { predecessor: gs_data[:slot_uuid] },
               auth_header
        }.to change(BaseSlot, :count).by 1
      end

      it "adds the category as a new user to the local db", :vcr do
        expect {
          post "/v1/globalslots/reslot",
               { predecessor: gs_data[:slot_uuid] },
               auth_header
        }.to change(User, :count).by 1
        new_slot = GlobalSlot.last
        new_user = User.last

        expect(new_slot.creator_id).to eq new_user.id
        expect(new_slot.creator.user_uuid).to eq raw_global_slot[:category_uuid]
      end

      context "category user known in backend" do
        let!(:category_user) {
          create(:user, role: 'global_slot_category',
                 user_uuid: raw_global_slot[:category_uuid])
        }

        it "doesn't add a new user to the local db", :vcr do
          expect {
            post "/v1/globalslots/reslot",
                 { predecessor: gs_data[:slot_uuid] },
                 auth_header
          }.not_to change(User, :count)
          new_slot = GlobalSlot.last

          expect(new_slot.creator_id).to eq category_user.id
          expect(new_slot.creator.user_uuid).to eq raw_global_slot[:category_uuid]
        end
      end

      it "adds the candy store location to the local db", :vcr do
        expect {
          post "/v1/globalslots/reslot",
               { predecessor: gs_data[:slot_uuid] },
               auth_header
        }.to change(IosLocation, :count)
        new_slot = GlobalSlot.last
        new_location = IosLocation.last

        expect(new_slot.ios_location.as_json).to eq new_location.as_json
        expect(new_slot.ios_location.uuid).to eq new_slot.location_uid
      end

      it "adds a note to the slot with the description", :vcr do
        expect {
          post "/v1/globalslots/reslot",
               { predecessor: gs_data[:slot_uuid] },
               auth_header
        }.to change(Note, :count)

        new_note = Note.last
        expect(new_note.content).not_to be_empty
      end

      it "doesn't add a note if the slot has no description", :vcr do
        expect {
          post "/v1/globalslots/reslot",
               { predecessor: gs_no_description_data[:slot_uuid] },
               auth_header
        }.not_to change(Note, :count)
        expect(response).to have_http_status :created
      end

      it "adds the slot to the users' MyCalendar", :vcr do
        expect {
          post "/v1/globalslots/reslot",
               { predecessor: gs_data[:slot_uuid] },
               auth_header
        }.to change(Passengership, :count)
        new_slot = GlobalSlot.last
        expect(current_user.my_calendar_slots).to include new_slot
      end

      it "adds the slot to other given slotgroups", :vcr do
        expect {
          post "/v1/globalslots/reslot",
               { predecessor: gs_data[:slot_uuid], slot_groups: [slot_group.uuid] },
               auth_header
        }.to change(Containership, :count)
        new_slot = GlobalSlot.last
        expect(slot_group.slots).to include new_slot
      end
    end

    context "global slot already in backend db" do
      let!(:global_slot) { create(:global_slot, :with_candy_location) }

      it "returns 201" do
        post "/v1/globalslots/reslot",
             { predecessor: global_slot.slot_uuid },
             auth_header
        expect(response).to have_http_status :created
      end

      it "doesn't create a new slot", :vcr do
        expect {
          post "/v1/globalslots/reslot",
               { predecessor: global_slot.slot_uuid },
               auth_header
        }.not_to change(BaseSlot, :count)
      end

      it "returns details of slot with given id" do
        post "/v1/globalslots/reslot",
             { predecessor: global_slot.slot_uuid },
             auth_header
        expect(json).to have_key('id')
        expect(json).to have_key('muid')
        expect(json).to have_key('title')
        expect(json).to have_key('startDate')
        expect(json).to have_key('endDate')
        expect(json).to have_key('notes')
        expect(json).to have_key('visibility')
        expect(json).to have_key('createdAt')
        expect(json).to have_key('updatedAt')
      end

      it "returns the candy store location", :vcr do
        post "/v1/globalslots/reslot",
             { predecessor: global_slot.slot_uuid },
             auth_header

        expect(json).to have_key 'location'
        expect(json['location']).not_to be_nil
        location = json['location']
        expect(location).to have_key 'latitude'
        expect(location).to have_key 'longitude'
        expect(location['latitude']).not_to be nil
        expect(location['longitude']).not_to be nil
      end
    end

    context "global slot with details" do
      let(:global_slot) { create(:global_slot, :with_details) }

      it "returns a note with a description" do
        post "/v1/globalslots/reslot",
             { predecessor: global_slot.slot_uuid },
             auth_header
        expect(json).to have_key('notes')
        expect(json['notes']).not_to be_empty
        json_note = json['notes'].first
        expect(json_note).to have_key('title')
        expect(json_note).to have_key('content')
        expect(json_note['title']).to eq 'Description'
      end
    end

    context "invalid muid" do
      it "returns 404 if no globalslot can be found for muid", :vcr do
        post "/v1/globalslots/reslot",
             { predecessor: 'e8fa3c76-75ac-852b-c81d-9c02b5f27c03' },
             auth_header
        expect(response).to have_http_status :not_found
      end

      # TODO: would be nicer to return a 422, but not worth it atm
      it "returns 503 if muid invalid", :vcr do
        post "/v1/globalslots/reslot",
             { predecessor: 'I-thought-I-was-an-alien' },
             auth_header
        expect(response).to have_http_status :service_unavailable
        expect(response.body).to include "Invalid input parameter 'muid'"
      end
    end
  end
end
