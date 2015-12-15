require 'rails_helper'

RSpec.describe "V1::Feed", :async, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user) }
  let(:actors) { create_list(:user, 3) }
  let(:meta_slot) { create(:meta_slot, creator: current_user) }
  let(:slot) { create(:std_slot_public, meta_slot: meta_slot) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /v1/feed/user" do
    it "returns 401 if auth token was missing" do
      get "/v1/feed/user", nil, nil
      expect(response.status).to be(401)
    end
  end

  describe "GET /v1/feed/user" do
    it "returns 401 if auth token was invalid" do
      get "/v1/feed/user", nil, 'Authorization' => "Token token=foobar"
      expect(response.status).to be(401)
    end
  end

  context "Activity creation", :redis do
    # test for Bug BKD-294
    describe "reslot a slot" do
      it "creates a new activity without an exception" do
        activities_before = $redis.keys.count
        expect {
          post "/v1/reslot/", { predecessorId: slot.id }, auth_header
        }.not_to raise_error
        expect($redis.keys.count).to be > activities_before
      end
    end
  end

  context "User feeds", :activity, :redis do
    before(:each) do
      # Create relationships:
      slot.add_follower(current_user)
      # Perform activities:
      actors.each do |actor|
        slot.create_comment(actor, 'This is a test comment.')
        slot.create_like(actor)
      end
    end

    describe "GET /v1/feed/user" do
      it "returns array of current user activities" do
        get "/v1/feed/user", nil, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(0)
      end
    end

    describe "GET /v1/feed/news" do
      it "returns array of aggregated user activities" do
        get "/v1/feed/news", nil, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(0)
      end
    end

    describe "GET /v1/feed/notification" do
      it "returns array of users notifications" do
        get "/v1/feed/notification", nil, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(6)
      end
    end

    describe "GET /v1/feed/notification" do
      let(:params) {{ limit: 2, offset: 2 }}

      it "returns cursor-based paginated array of activities" do
        get "/v1/feed/notification", params, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(4) # 6 - 2 = 4.limit(2) = 2
      end
    end

    describe "GET /v1/feed/notification" do
      let(:params) {{ limit: 2, cursor: "2" }}

      it "returns cursor-based paginated array of activities" do
        get "/v1/feed/notification", params, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(4) # 6 - 4 = 2.limit(2) = 2
      end
    end
  end
end
