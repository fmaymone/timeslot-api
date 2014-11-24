require 'rails_helper'

RSpec.describe "V1::BaseSlots", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "POST /v1/slots" do
    let!(:current_user) { create(:user) }

    context "with valid params" do
      let(:valid_slot) { attributes_for(:meta_slot) }

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

    context "with invalid params" do
      describe "does not add a new entry to the DB" do
        it "for empty title" do
          expect {
            post "/v1/slots/", new_slot: attributes_for(:meta_slot, title: nil)
          }.not_to change(MetaSlot, :count)
        end

        it "for empty startdate" do
          expect {
            post "/v1/slots/", new_slot: attributes_for(:meta_slot, startdate: "")
          }.not_to change(MetaSlot, :count)
        end
      end

      xdescribe "responds with http status Unprocessable Entity (422)" do
        it "for empty title" do
          post "/v1/slots/", new_slot: attributes_for(:meta_slot, title: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty startdate" do
          post "/v1/slots/", new_slot: attributes_for(:meta_slot, startdate: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid startdate" do
          post "/v1/slots/", new_slot: attributes_for(:meta_slot,
                                                      startdate: "|$%^@wer")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for empty enddate" do
          post "/v1/slots/", new_slot: attributes_for(:meta_slot, enddate: "")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "for invalid enddate" do
          post "/v1/slots/", new_slot: attributes_for(:meta_slot,
                                                      enddate: "|$%^@wer")
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if startdate equals enddate" do
          slot = attributes_for(:meta_slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-09-08 13:31:02")
          post "/v1/slots/", new_slot: slot
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "if startdate after enddate"  do
          slot = attributes_for(:meta_slot,
                                startdate: "2014-09-08 13:31:02",
                                enddate: "2014-07-07 13:31:02")
          post "/v1/slots/", new_slot: slot
          expect(response).to have_http_status(:unprocessable_entity)
        end

        # it "for empty visibility" do
        #   post "/v1/slots/", new_slot: attributes_for(:meta_slot, visibility: "")
        #   expect(response).to have_http_status(:unprocessable_entity)
        # end

        # it "for invalid characters for visibility" do
        #   post "/v1/slots/", new_slot: attributes_for(:meta_slot, visibility: "$$")
        #   expect(response).to have_http_status(:unprocessable_entity)
        # end

        # it "if visibility has to much characters" do
        #   post "/v1/slots/", new_slot: attributes_for(:meta_slot, visibility: "101")
        #   expect(response).to have_http_status(:unprocessable_entity)
        # end
      end
    end
  end
end
