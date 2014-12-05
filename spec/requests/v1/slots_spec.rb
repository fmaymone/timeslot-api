require 'rails_helper'

RSpec.describe "V1::Slots", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET /v1/slots/:id" do
    let(:std_slot) { create(:std_slot) }
    let(:group_slot) { create(:group_slot) }

    context "GroupSlot, with valid ID" do
      it "returns success" do
        get "/v1/slots/#{group_slot.id}"
        expect(response).to have_http_status(200)
        expect(json).to have_key('groupId')
        expect(json['id']).to eq(group_slot.id)
        expect(json['groupId']).to eq(group_slot.group_id)
      end
    end

    context "StdSlot, with valid ID" do
      it "returns success" do
        get "/v1/slots/#{std_slot.id}"
        expect(response).to have_http_status(200)
      end

      it "returns details of slot with given id" do
        get "/v1/slots/#{std_slot.id}"
        expect(json).to have_key('id')
        expect(json).to have_key('title')
        expect(json).to have_key('startdate')
        expect(json).to have_key('enddate')
        expect(json).to have_key('note')
        expect(json).to have_key('visibility')
        expect(json).to have_key('createdAt')
        expect(json).to have_key('updatedAt')
      end

      it "does return the correct attributes" do
        get "/v1/slots/#{std_slot.id}"
        expect(json['id']).to eq(std_slot.id)
        expect(json['title']).to eq(std_slot.title)
        expect(json['startdate']).to eq(std_slot.startdate.iso8601)
        expect(json['enddate']).to eq(std_slot.enddate.iso8601)
        expect(json['note']).to eq(std_slot.note)
        expect(json['visibility']).to eq(std_slot.visibility)
      end

      it "does return the slot title" do
        std_slot.meta_slot.update(title: "Expected title")
        get "/v1/slots/#{std_slot.id}"
        expect(json['title']).to eq("Expected title")
      end
    end

    context "with invalid ID" do
      it "returns not found" do
        wrong_id = std_slot.id + 1
        get "/v1/slots/#{wrong_id}"
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
