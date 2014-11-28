require 'rails_helper'

RSpec.describe "V1::BaseSlots", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET /v1/slots" do
    let!(:current_user) { create(:user) }

    let(:metas) { create_list(:meta_slot, 2, creator: current_user) }
    let!(:std_slot_1) { create(:std_slot, meta_slot: metas[0]) }
    let!(:std_slot_2) { create(:std_slot, meta_slot: metas[1]) }
    let!(:re_slots) { create_list(:re_slot, 3, slotter: current_user) }

    let(:groups) { create_list(:group, 2) }
    let!(:memberships) {
      create(:membership, group: groups[0], user: current_user)
      create(:membership, group: groups[1], user: current_user) }
    let!(:group_slots_1) { create_list(:group_slot, 3, group: groups[0]) }
    let!(:group_slots_2) { create_list(:group_slot, 5, group: groups[1]) }

    it "returns success" do
      get "/v1/slots"
      expect(response.status).to be(200)
    end

    it "returns all slots for the current_user" do
      get "/v1/slots"
      slots_count = 2 + re_slots.size + group_slots_1.size + group_slots_2.size
      expect(json.length).to eq slots_count
    end

    it "returns the details of the first slot" do
      get "/v1/slots"
      expect(json.first).to include std_slot_1.as_json.except(
                                      "footest", "meta_slot_id",
                                      "created_at", "updated_at", "deleted_at")
    end
  end

  describe "POST /v1/stdlot" do
    let!(:current_user) { create(:user) }

    context "StdSlot with valid params" do
      let(:valid_slot) { attributes_for(:meta_slot).merge(visibility: '10') }

      it "responds with http status Created (201)" do
        post "/v1/stdslot/", new_slot: valid_slot
        expect(response).to have_http_status(:created)
      end

      it "adds a new entry to the DB" do
        expect {
          post "/v1/stdslot/", new_slot: valid_slot
        }.to change(MetaSlot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/stdslot/", new_slot: valid_slot
        expect(json['id']).to eq(StdSlot.last.id)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        attributes_for(:meta_slot).merge(visibility: '01')
      }
      describe "does not add a new entry to the DB" do
        it "for empty title" do
          invalid_attributes[:title] = nil
          expect {
            post "/v1/stdslot/", new_slot: invalid_attributes
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include 'error' && 'title'
        end

        it "for empty startdate" do
          invalid_attributes[:startdate] = ""
          expect {
            post "/v1/stdslot/", new_slot: invalid_attributes
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include 'error' && 'startdate'
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      describe "responds with http status Unprocessable Entity (422)" do
        it "for empty title" do
          invalid_attributes[:title] = ""
          post "/v1/stdslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'title' && 'blank'
        end

        it "for invalid startdate" do
          invalid_attributes[:startdate] = "|$%^@wer"
          post "/v1/stdslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'startdate' && 'blank'
        end

        it "for empty enddate" do
          invalid_attributes[:enddate] = ""
          post "/v1/stdslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'blank'
        end

        it "if startdate equals enddate" do
          slot = attributes_for(:meta_slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-09-08 13:31:02")
          post "/v1/stdslot/", new_slot: slot.merge(visibility: '11')
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'start date'
        end

        it "if startdate after enddate"  do
          slot = attributes_for(:meta_slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-07-07 13:31:02")
          post "/v1/stdslot/", new_slot: slot.merge(visibility: '11')
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'start date'
        end

        it "for empty visibility" do
          post "/v1/stdslot/", new_slot: attributes_for(:meta_slot, visibility: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for visibility" do
          post "/v1/stdslot/", new_slot: attributes_for(:meta_slot, visibility: "$$")
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'pgerror'
        end

        it "if visibility has to much characters" do
          post "/v1/stdslot/", new_slot: attributes_for(:meta_slot, visibility: "101")
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'pgerror'
        end
      end
    end
  end

  describe "POST /v1/groupslot" do
    let!(:current_user) { create(:user) }
    let(:group) { create(:group) }

    context "GroupSlot with valid params" do
      let(:valid_slot) { attributes_for(:meta_slot).merge(group_id: group.id) }

      it "responds with http status Created (201)" do
        post "/v1/groupslot/", new_slot: valid_slot
        expect(response).to have_http_status(:created)
      end

      it "adds a new entry to the DB" do
        expect {
          post "/v1/groupslot/", new_slot: valid_slot
        }.to change(MetaSlot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/groupslot/", new_slot: valid_slot
        expect(json['id']).to eq(GroupSlot.last.id)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        attributes_for(:meta_slot).merge(group_id: group.id)
      }
      describe "does not add a new entry to the DB" do
        it "with missing group ID" do
          expect {
            post "/v1/groupslot/", new_slot: attributes_for(:meta_slot)
          }.not_to change(MetaSlot, :count) || change(GroupSlot, :count)
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "with invalid group ID" do
          expect {
            post "/v1/groupslot/", new_slot: attributes_for(:meta_slot).merge(
                   group_id: 1)
          }.not_to change(MetaSlot, :count) || change(GroupSlot, :count)
          expect(response).to have_http_status(:not_found)
        end
      end

      describe "responds with http status Unprocessable Entity (422)" do
        it "for empty title" do
          invalid_attributes[:title] = ""
          post "/v1/groupslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'title' && 'blank'
        end

        it "for invalid startdate" do
          invalid_attributes[:startdate] = "|$%^@wer"
          post "/v1/groupslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'startdate' && 'blank'
        end

        it "for empty enddate" do
          invalid_attributes[:enddate] = ""
          post "/v1/groupslot/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'blank'
        end

        it "if startdate equals enddate" do
          group_slot = attributes_for(:meta_slot,
                                      startdate: "2014-09-08 13:31:02",
                                      enddate: "2014-09-08 13:31:02",
                                      group_id: group.id)
          post "/v1/groupslot/", new_slot: group_slot
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'start date'
        end

        it "if startdate after enddate"  do
          group_slot = attributes_for(:meta_slot,
                                      startdate: "2014-09-08 13:31:02",
                                      enddate: "2014-07-07 13:31:02",
                                      group_id: group.id)
          post "/v1/groupslot/", new_slot: group_slot
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'start date'
        end
      end
    end
  end
end
