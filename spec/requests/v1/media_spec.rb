require 'rails_helper'

RSpec.describe "V1::Media", type: :request do
  describe "GET /v1/media-signature" do
    it "returns success" do
      get "/v1/media-signature"
      expect(response.status).to be(201)
    end

    it "responds with a cloudinary signature" do
      get "/v1/media-signature"
      json = JSON.parse(response.body)
      expect(json).to have_key('public_id')
      expect(json).to have_key('signature')
      expect(json).to have_key('timestamp')
      expect(json).to have_key('api_key')
    end

    it "returns 503 if signature creation fails" do
      skip
      get "/v1/media-signature"
      expect(response).to have_http_status(:service_unavailable)
    end
  end
end
