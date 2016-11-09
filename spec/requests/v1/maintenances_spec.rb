require 'rails_helper'

RSpec.describe "V1::Maintenances", type: :request do
  describe "GET /v1/maintenances" do
    it "returns 200 OK" do
      get "/v1/maintenance"
      expect(response).to have_http_status :ok
    end
  end
end
