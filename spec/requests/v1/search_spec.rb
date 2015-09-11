require 'rails_helper'

RSpec.describe "V1::Search", :focus, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  describe "GET /search/" do
    it "returns 422 if action was missing" do
      get "/v1/search/", {}, auth_header
      expect(response.status).to be(422)
    end
  end

  describe "GET /search/user" do
    it "returns 422 if parameters was missing" do
      get "/v1/search/user", nil, auth_header
      expect(response.status).to be(422)
    end
  end

  describe "GET /search/user" do
    let(:query) { nil }

    it "returns 422 if query was nil" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(422)
    end
  end

  describe "GET /search/user" do
    let(:query) {{ query: 'Us' }}

    it "returns empty array if query was too short" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 0
    end
  end

  describe "GET /search/user" do
    let(:query) {{ query: '$~#%a§_+(b)&/?-' }}

    it "returns empty array if filtered query was too short" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 0
    end
  end

  describe "GET /search/user" do
    let(:query) {{ query: current_user.username }}

    it "returns search results of users" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
    end
  end

  describe "GET /search/user" do
    let!(:user) { create(:user, username: 'Pere Olerence') }
    let(:query) {{ query: 'péré ôlérencè' }}

    it "returns transliterated search results of users" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
    end
  end

  describe "GET /search/user" do
    let!(:users) { create_list(:user, 10) }
    let(:query) {{ query: 'User', page: 3, limit: 3 }}

    it "returns paginated search results of users" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 3
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
    end
  end

  describe "GET /search/user" do
    let(:query) {{ query: 'joh do' }}
    let!(:users) {[ create(:user, username: 'Foo Bar'),
                    create(:user, username: 'John Doe'),
                    create(:user, username: 'John Dolce'),
                    create(:user, username: 'Johny Doehetry'),
                    create(:user, username: 'Joh Do'),
                    create(:user, username: 'John Doeh'),
                    create(:user, username: 'Jo Do'),
                    create(:user, username: 'Bar Foo') ]}

    it "returns sorted search results of users" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 5
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
      expect(json.first['username']).to eq('Joh Do')
      expect(json.last['username']).to eq('Johny Doehetry')
    end
  end

  describe "GET /search/user" do
    let(:query) {{ query: current_user.email, attr: 'email' }}

    it "returns search results of users by a custom attribute" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
    end
  end

  describe "GET /search/email" do
    let(:query) {{ query: current_user.email }}

    it "returns search results of users by email" do
      get "/v1/search/email", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
    end
  end

  describe "GET /search/slot" do
    let(:slot) { create(:std_slot_public, :with_media, creator: current_user) }
    let(:query) {{ query: slot.title }}

    it "returns search results of slots" do
      get "/v1/search/slot", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('title')
      expect(json.first).to have_key('startDate')
    end
  end

  describe "GET /search/media" do
    let(:slot) { create(:std_slot_public, :with_media, creator: current_user) }
    let(:query) {{ query: slot.media_items.first.title }}

    it "returns search results of media" do
      get "/v1/search/media", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('mediaId')
      expect(json.first).to have_key('mediaType')
    end
  end

  describe "GET /search/group" do
    let(:group) { create(:group, :with_3_members, name: 'Timeslot Official') }
    let(:query) {{ query: group.name }}

    it "returns search results of media" do
      get "/v1/search/group", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('id')
      expect(json.first).to have_key('upcomingCount')
    end
  end

  describe "GET /search/location" do
    let(:ios_location) { create(:ios_location, name: 'Alexanderplatz') }
    let(:query) {{ query: ios_location.name }}

    it "returns search results of media" do
      get "/v1/search/location", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('latitude')
      expect(json.first).to have_key('longitude')
    end
  end

  describe "GET /search/user" do
    # http://rails-sqli.org/
    let(:query) {{ query: "') OR 1--" }}

    it "check immunity of sql injection" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 0
    end
  end

  # maybe this can help us for testing bad user inputs:
  # https://github.com/minimaxir/big-list-of-naughty-strings
end
