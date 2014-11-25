require 'rails_helper'

RSpec.describe "V1::BaseSlots", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "POST /v1/slots" do
    let!(:current_user) { create(:user) }

    context "StdSlot with valid params" do
      let(:valid_slot) { attributes_for(:meta_slot).merge(visibility: '10') }

      it "responds with http status Created (201)" do
        post "/v1/slots/", new_slot: valid_slot
        expect(response).to have_http_status(:created)
      end

      it "adds a new entry to the DB" do
        expect {
          post "/v1/slots/", new_slot: valid_slot
        }.to change(MetaSlot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/slots/", new_slot: valid_slot
        expect(json['id']).to eq(StdSlot.last.id)
      end
    end

    context "GroupSlot with valid params" do
      let(:group) { create(:group) }
      let(:valid_slot) { attributes_for(:meta_slot).merge(group_id: group.id) }

      it "responds with http status Created (201)" do
        post "/v1/slots/", new_slot: valid_slot
        expect(response).to have_http_status(:created)
      end

      it "adds a new entry to the DB" do
        expect {
          post "/v1/slots/", new_slot: valid_slot
        }.to change(MetaSlot, :count).by(1)
      end

      it "returns the ID of the new slot" do
        post "/v1/slots/", new_slot: valid_slot
        expect(json['id']).to eq(GroupSlot.last.id)
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
            post "/v1/slots/", new_slot: invalid_attributes
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include 'error' && 'title'
        end

        it "for empty startdate" do
          invalid_attributes[:startdate] = ""
          expect {
            post "/v1/slots/", new_slot: invalid_attributes
          }.not_to change(MetaSlot, :count)
          expect(response.body).to include 'error' && 'startdate'
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "with invalid group ID" do
          expect {
            post "/v1/slots/", new_slot: attributes_for(:meta_slot).merge(
                   group_id: 1)
          }.not_to change(MetaSlot, :count) || change(GroupSlot, :count)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end

      describe "responds with http status Unprocessable Entity (422)" do
        it "for empty title" do
          invalid_attributes[:title] = ""
          post "/v1/slots/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'title' && 'blank'
        end

        it "for invalid startdate" do
          invalid_attributes[:startdate] = "|$%^@wer"
          post "/v1/slots/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'startdate' && 'blank'
        end

        it "for empty enddate" do
          invalid_attributes[:enddate] = ""
          post "/v1/slots/", new_slot: invalid_attributes
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'blank'
        end

        it "if startdate equals enddate" do
          slot = attributes_for(:meta_slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-09-08 13:31:02")
          post "/v1/slots/", new_slot: slot.merge(visibility: '11')
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'start date'
        end

        it "if startdate after enddate"  do
          slot = attributes_for(:meta_slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-07-07 13:31:02")
          post "/v1/slots/", new_slot: slot.merge(visibility: '11')
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'enddate' && 'start date'
        end

        it "for empty visibility" do
          post "/v1/slots/", new_slot: attributes_for(:meta_slot, visibility: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid characters for visibility" do
          post "/v1/slots/", new_slot: attributes_for(:meta_slot, visibility: "$$")
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'pgerror'
        end

        it "if visibility has to much characters" do
          post "/v1/slots/", new_slot: attributes_for(:meta_slot, visibility: "101")
          expect(response).to have_http_status(:unprocessable_entity)
          expect(response.body).to include 'pgerror'
        end
      end
    end
  end
end
