require 'rails_helper'

RSpec.describe "V1::Maintenances", type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "GET /v1/maintenances" do
    it "returns 200 OK" do
      get "/v1/maintenance"
      expect(response).to have_http_status :ok
    end
  end

  describe "GET /v1/maintenances/clientversions" do
    it "returns 200 OK" do
      get "/v1/maintenance/clientversions"
      expect(response).to have_http_status :ok
      expect(json).to have_key('versions')
      expect(json['versions']).to have_key('ios')
      expect(json['versions']).to have_key('android')
    end
  end
end
