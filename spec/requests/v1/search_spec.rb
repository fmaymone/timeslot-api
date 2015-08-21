require 'rails_helper'

RSpec.describe "V1::Search", :focus, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:slot) { create(:std_slot_public, :with_media, creator: current_user) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /search/users" do
    it "returns 422 if query was missing" do
      get "/v1/search/users", nil, auth_header
      expect(response.status).to be(422)
    end
  end

  describe "GET /search/users" do
    let(:query) { nil }
    it "returns 422 if query was nil" do
      get "/v1/search/users", query, auth_header
      expect(response.status).to be(422)
    end
  end

  describe "GET /search/users" do
    let(:query) { '12' }
    it "returns 422 if query was too short" do
      get "/v1/search/users", query, auth_header
      expect(response.status).to be(422)
    end
  end

  describe "GET /search/users" do
    let(:query) {{ query: current_user.username }}
    it "returns search results of users" do
      get "/v1/search/users", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('email')
    end
  end

  describe "GET /search/slots" do
    let(:query) {{ query: slot.title }}
    it "returns search results of slots" do
      get "/v1/search/slots", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('title')
      expect(json.first).to have_key('start_date')
    end
  end

  describe "GET /search/media" do
    let(:query) {{ query: slot.media_items.first.title }}
    it "returns search results of media" do
      get "/v1/search/media", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('title')
      expect(json.first).to have_key('public_id')
    end
  end
end
