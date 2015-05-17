require 'rails_helper'

RSpec.describe "V1::Locations", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET /locations/search" do
    it "returns search results", :vcr do
      get "/v1/locations/search", { q: "berghain", pos: "13.0,52.0", limit: 10 }
      expect(response.status).to be(200)
      expect(json.length).to eq 10
      expect(json.first).to have_key('name')
      expect(json.first).to have_key('id')
      expect(json.first).to have_key('score')
    end
  end
end
