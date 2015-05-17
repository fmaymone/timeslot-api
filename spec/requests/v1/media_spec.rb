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
      expect(json).to have_key('publicId')
      expect(json).to have_key('signature')
      expect(json).to have_key('timestamp')
      expect(json).to have_key('apiKey')
    end
  end
end
