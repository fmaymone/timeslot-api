require 'rails_helper'

RSpec.describe "V1::Slots", type: :request do
  let(:slot) { create(:slot) }
  let(:accept_json) { { "Accept" => "application/json" } }

  describe "GET /v1/slots/:id" do
    it "returns success" do
      get v1_slot_path(id: slot.id), accept_json
      expect(response.status).to be(200)
    end

    it "returns details of slot with given id" do
      get v1_slot_path(id: slot.id), accept_json
      json = JSON.parse(response.body)
      expect(json).to have_key('id')
      expect(json).to have_key('title')
      expect(json).to have_key('startdate')
      expect(json).to have_key('enddate')
      expect(json).to have_key('note')
      expect(json).to have_key('visibility')
      expect(json).to have_key('alerts')
      expect(json).to_not have_key('created_at')
      expect(json).to_not have_key('updated_at')
    end

    it "does return the slots title" do
      slot = create(:slot, title: "Expected title")
      get v1_slot_path(id: slot.id), accept_json
      json = JSON.parse(response.body)
      expect(json['title']).to eq("Expected title")
    end
  end

  describe "POST /v1/slots" do
    describe "with valid params" do
      let(:valid_slot) { attributes_for(:slot) }

      it "responds with http status Created (201)" do
        post "/v1/slots/", valid_slot.to_param, accept_json
        expect(response).to have_http_status(:created)
      end

      it "creates a slot and returns its ID" do
        post "/v1/slots/", valid_slot.to_param, accept_json
        json = JSON.parse(response.body)
        expect(json).to have_key('id')
      end
    end

    describe "with invalid params" do
      let(:invalid_slot) { attributes_for(:slot, title: nil) }

      it "responds with http status Unprocessable Entity (422)" do
        post "/v1/slots/", invalid_slot.to_param, accept_json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /v1/slots/:id" do
    describe "with valid params" do
      it "responds with http status No Content (204)" do
        patch "/v1/slots/#{slot.id}", slot: { title: "Something" }
        expect(response).to have_http_status(:no_content)
      end

      it "updates the title of a given slot" do
        patch "/v1/slots/#{slot.id}", slot: { title: "New title" }
        slot.reload
        expect(slot.title).to eq('New title')
      end
    end

    describe "with invalid params" do
      it "responds with Unprocessable Entity for invalid title)" do
        patch "/v1/slots/#{slot.id}", slot: { title: "" }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "responds with Unprocessable Entity for invalid startdate" do
        patch "/v1/slots/#{slot.id}", slot: { startdate: "" }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      describe "with an invalid ID" do
        it "responds with http status Not Found (404)" do
          wrong_id = slot.id + 1
          patch "/v1/slots/#{wrong_id}", slot: { title: "Something" }
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end

  describe "DELETE /v1/slots/:id" do
    describe "with valid params" do

      it "returns http No Content (204)" do
        delete "/v1/slots/#{slot.id}"
        expect(response).to have_http_status(:no_content)
      end

      it "destroys the requested slot" do
        slot = Slot.create! attributes_for(:slot)
        expect {
          delete "/v1/slots/#{slot.id}"
        }.to change(Slot, :count).by(-1)
      end
    end

    describe "with an invalid ID" do
      it "responds with http status Not Found" do
        wrong_id = slot.id + 1
        delete "/v1/slots/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end
    end

  end
end
