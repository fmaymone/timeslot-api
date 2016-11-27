require 'rails_helper'

RSpec.describe "V1::Maintenances", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET /" do
    it "returns 401" do
      get "/"
      expect(response).to have_http_status :unauthorized
    end
  end

  describe "GET /v1/maintenance" do
    it "returns 200 OK" do
      get "/v1/maintenance"
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /v1/maintenance/clientversions" do
    it "returns 200 OK" do
      get "/v1/maintenance/clientversions"
      expect(response).to have_http_status :ok
      expect(json).to have_key('versions')
      expect(json['versions']).to have_key('ios')
      expect(json['versions']).to have_key('android')
    end
  end

  describe "GET /v1/maintenance/clean-db" do
    let!(:db_content) {
      create(:std_slot)
      create(:user)
    }

    it "empties the db", :commit do
      expect(BaseSlot.count).to be 1
      expect(User.count).not_to be 0
      get "/v1/maintenance/clean-db"
      expect(response.status).to be(200)
      expect(BaseSlot.count).to be 0
      expect(User.count).to be 0
    end
  end
end
