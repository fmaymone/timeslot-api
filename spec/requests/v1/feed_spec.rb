require 'rails_helper'

RSpec.describe "V1::Feed", :focus, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password, :with_feed) }
  let(:actors) { create_list(:user, 3, :with_feed) }
  let(:slot) { create(:std_slot_public, owner: current_user) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  before(:each) do
    actors.each do |actor|
      slot.create_comment(actor, 'This is a test comment.')
      slot.create_like(actor)
    end
  end

  describe "GET /v1/feed/user" do
    it "returns 401 if auth token was missing" do
      get "/v1/feed/user", nil, nil
      expect(response.status).to be(401)
    end
  end

  describe "GET /v1/feed/user" do
    it "returns 401 if auth token was invalid" do
      get "/v1/feed/user", nil, { 'Authorization' => "Token token=foobar" }
      expect(response.status).to be(401)
    end
  end

  context "User feeds", :redis do
    describe "GET /v1/feed/user" do
      it "returns array of current user activities" do
        get "/v1/feed/user", nil, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(4)
      end
    end

    describe "GET /v1/feed/news" do
      it "returns array of aggregated user activities" do
        get "/v1/feed/news", nil, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(6)
      end
    end

    describe "GET /v1/feed/notification" do
      it "returns array of users notifications" do
        get "/v1/feed/notification", nil, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(6)
      end
    end

    describe "GET /v1/feed/user" do
      let(:params) {{ limit: 2, offset: 2 }}

      it "returns cursor-based paginated array of activities" do
        get "/v1/feed/user", params, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(2) # 6 - 2 = 4.limit(2)
      end
    end

    describe "GET /v1/feed/user" do
      let(:params) {{ limit: 2, cursor: "2" }}

      it "returns cursor-based paginated array of activities" do
        get "/v1/feed/user", params, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(1) # 3 - 2 = 1.limit(2)
      end
    end
  end
end
