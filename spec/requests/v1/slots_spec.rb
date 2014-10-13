require 'rails_helper'

RSpec.describe "V1::Slots", type: :request do
  let(:slot) { create(:slot) }

  describe "GET /v1/slots/:id" do
    it "returns success" do
      get v1_slot_path(id: slot.id), format: 'json'
      expect(response.status).to be(200)
    end

    it "returns details of slot with given id" do
      get v1_slot_path(id: slot.id), format: 'json'
      json = JSON.parse(response.body)
      expect(json).to have_key('title')
    end

    it "does return the slots title" do
      slot = create(:slot, title: "Expected title")
      get v1_slot_path(id: slot.id), format: 'json'
      json = JSON.parse(response.body)
      expect(json['title']).to eq("Expected title")
    end
  end
end
