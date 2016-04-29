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
    describe "reslot a slot" do
      it "creates a new activity without an exception" do
        activities_before = storage.keys.count
        expect {
          # Perform activity:
          post "/v1/slots/#{slot.id}/user_tags",
               {
                   user_tags: actors.collect(&:id)
               },
               auth_header
        }.not_to raise_error
        expect(storage.keys.count).to be > activities_before
      end
    end
  end

  context "User feeds", :activity, :redis do
    before(:each) do
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
        expect(json.length).to be(1) # activities on own content
      end

      context "cursor-based pagination" do
        let!(:slots) { create_list(:std_slot_public, 5, creator: current_user)}
        let!(:pages) do
          # Create activities:
          slots.each do |slot|
            actors.each do |actor|
              slot.create_comment(actor, 'This is a test comment.')
              slot.create_like(actor)
            end
          end
          # Determine pages
          get "/v1/feed/news", {}, auth_header
          JSON.parse(response.body)
        end
        let(:ids) { pages.map{|hash| hash['id']} }
        let(:cursors) { pages.map{|hash| hash['cursor']} }

        context "cursor starts from zero" do
          let(:params) {{ limit: 10, cursor: 0 }}

          it "returns cursor-based paginated array of activities" do
            get "/v1/feed/news", params, auth_header
            expect(response.status).to be(200)
            expect(json.length).to be(6) # 6 - 0 = 6.limit(10) = 6

            json_str = json.to_json
            expect(json_str).to include(ids[0])
            expect(json_str).to include(ids[1])
            expect(json_str).to include(ids[2])
            expect(json_str).to include(ids[3])
            expect(json_str).to include(ids[4])
            expect(json_str).to include(ids[5])
          end
        end

        context "cursor has start and limit" do
          let(:params) {{ limit: 2, cursor: cursors[2] }}

          it "returns cursor-based paginated array of activities" do
            get "/v1/feed/news", params, auth_header
            expect(response.status).to be(200)
            expect(json.length).to be(2) # 6 - 3 = 3.limit(2) = 2

            json_str = json.to_json
            expect(json_str).to include(ids[3])
            expect(json_str).to include(ids[4])
          end
        end

        context "cursor points beyond the end" do
          let(:params) {{ limit: 2, cursor: cursors[5] }}

          it "returns empty array of activities" do
            get "/v1/feed/news", params, auth_header
            expect(response.status).to be(200)
            expect(json.length).to be(0) # 6 - 6 = 0.limit(2) = 0
          end
        end
      end
    end

    describe "GET /v1/feed/notification" do
      it "returns array of users notifications" do
        get "/v1/feed/notification", nil, auth_header
        expect(response.status).to be(200)
        expect(json.length).to be(6)
      end

      context "offset-based pagination" do
        let(:params) {{ limit: 2, offset: 2 }}

        it "returns offset-based paginated array of activities" do
          get "/v1/feed/notification", params, auth_header
          expect(response.status).to be(200)
          expect(json.length).to be(2) # 6 - 2 = 4.limit(2) = 2
        end
      end

      context "cursor-based-to-offset pagination" do
        let(:params) {{ limit: 2, cursor: "5" }}

        it "returns cursor-based-to-offset paginated array of activities (fallback)" do
          get "/v1/feed/notification", params, auth_header
          expect(response.status).to be(200)
          expect(json.length).to be(1) # 6 - 5 = 1.limit(2) = 1
        end
      end
    end
  end
end
