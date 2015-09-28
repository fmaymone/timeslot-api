require 'rails_helper'

RSpec.describe "V1::Activity", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/activity/user" do
    it "returns 401 if auth token was missing" do
      get "/v1/activity/user", nil, nil
      expect(response.status).to be(401)
    end
  end

  describe "GET /v1/activity/user" do
    it "returns 401 if auth token was invalid" do
      get "/v1/activity/user", nil, { 'Authorization' => "Token token=foobar" }
      expect(response.status).to be(401)
    end
  end

  describe "GET /v1/activity/news" do
    let(:params) {{ style: 'foo' }}
    it "returns 422 if parameters was invalid" do
      get "/v1/activity/news", params, auth_header
      expect(response.status).to be(422)
    end
  end

  describe "GET /v1/activity/news", :activity do
    let(:params) {{ style: 'flat' }}

    it "returns array of activities" do
      get "/v1/activity/news", params, auth_header
      expect(response.status).to be(200)
      expect(json.length).to be(1)
    end
  end

  describe "GET /v1/activity/user", :activity do
    let(:params) {{ limit: 2, offset: 0 }}

    it "returns paginated array of activities" do
      get "/v1/activity/user", params, auth_header
      expect(response.status).to be(200)
      expect(json.length).to be(2)
      expect(json.first['message']).to eq("User 53 commented on 'Slot title 21'")
    end
  end

  describe "GET /v1/activity/user", :activity do
    let(:params) {{ limit: 2, cursor: "0cbf7380-65f3-11e5-8080-80006cf73f47" }}

    it "returns cursor-based paginated array of activities" do
      get "/v1/activity/user", params, auth_header
      expect(response.status).to be(200)
      expect(json.length).to be(2)
      expect(json.first['message']).to eq("User 53 commented on 'Slot title 21'")
    end
  end
end
