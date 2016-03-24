require 'rails_helper'

RSpec.describe "V1::GlobalSlots", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "POST /v1/globalslots/search" do
    let(:query) { "q=Love&category=cinema&moment=2016-07-18&limit=20" }

    it "returns 200 and results", :vcr do
      get "/v1/globalslots/search?#{query}", {}, auth_header

      expect(response).to have_http_status :ok
      expect(json).not_to be_empty
    end

    context "invalid search params" do
      let(:invalid_query) { "q=Frei&category=foobar&moment=2015-12-18&limit=20" }

      it "returns 422 for invalid category", :vcr do
        get "/v1/globalslots/search?#{invalid_query}", {},
            auth_header
        expect(response).to have_http_status :unprocessable_entity
        expect(response.body).to include "foobar is not a valid value for"
        expect(response.body).to include "category"
      end
    end
  end

  describe "POST /v1/globalslots/reslot", :seed do
    context "global slot not in backend db" do
      let(:gs_data) { attributes_for(:global_slot) }
      let(:slot_group) { create(:group, owner: current_user) }

      it "returns 201", :vcr do
        post "/v1/globalslots/reslot",
             { predecessor: gs_data[:slot_uuid] },
             auth_header
        expect(response).to have_http_status :created
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
      let(:global_slot) { create(:global_slot, :with_candy_location) }

      it "returns 201" do
        post "/v1/globalslots/reslot",
             { predecessor: global_slot.slot_uuid },
             auth_header
        expect(response).to have_http_status :created
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
