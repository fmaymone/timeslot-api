require 'rails_helper'

RSpec.describe "V1::Search", type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) do
    { 'Authorization' => "Token token=#{current_user.auth_token}" }
  end

  # global search (elastic search)
  # describe "GET /v1/search/", :vcr do
  #   it "returns 422 if action was missing" do
  #     get "/v1/search/", {}, auth_header
  #     expect(response.status).to be(422)
  #   end
  # end

  describe "GET /v1/search/user" do
    it "returns 422 if parameters was missing" do
      get "/v1/search/user", nil, auth_header
      expect(response.status).to be(422)
    end
  end

  describe "GET /v1/search/user" do
    let(:query) {{ query: 'Us' }}

    it "returns empty array if query was too short" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 0
    end
  end

  describe "GET /v1/search/user" do
    let(:query) {{ query: '$~#%a§_+(b)&/?-' }}

    it "returns empty array if filtered query was too short" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 0
    end
  end

  describe "GET /v1/search/user" do
    let(:query) {{ query: current_user.username }}

    it "returns search results of users" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
    end
  end

  describe "GET /v1/search/user" do
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

  describe "GET /v1/search/user" do
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

  describe "GET /v1/search/user" do
    let(:query) {{ query: 'jon doe' }}
    let!(:users) {[ create(:user, :with_email, username: 'Foo Bar'), # not included
                    create(:user, :with_email, username: 'John Doe'), # optimum result
                    create(:user, :with_email, username: 'John Dolce'),
                    create(:user, :with_email, username: 'Johny Doehetry'), # included
                    create(:user, :with_email, username: 'Johny Darwin'), # included when metaphone
                    create(:user, :with_email, username: 'Joh Do'),
                    create(:user, :with_email, username: 'John Doeh'),
                    create(:user, :with_email, username: 'Jon Doh'),
                    create(:user, :with_email, username: 'Don John'), # not included when metaphone
                    create(:user, :with_email, username: 'Bar Foo') ]} # not included

    it "returns sorted search results of users" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 7
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
      expect(json.first['username']).to eq('John Doe')
      expect(json.last['username']).to eq('Johny Doehetry')
    end
  end

  describe "GET /v1/search/user" do
    let(:query) {{ query: current_user.email, attr: 'email' }}

    it "returns search results of users by a custom attribute" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
    end
  end

  describe "GET /v1/search/user" do
    let(:query) {{ query: 'Joh Do', method: 'equal' }}
    let!(:users) {[ create(:user, :with_email, username: 'John Doe'),
                    create(:user, :with_email, username: 'Joh Do'),
                    create(:user, :with_email, username: 'John Doeh'),
                    create(:user, :with_email, username: 'Jon Doh') ]}

    it "returns search results of users by a custom search algorithm" do
      get "/v1/search/user", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
      expect(json.first['username']).to eq('Joh Do')
    end
  end

  describe "GET /v1/search/email" do
    let(:query) {{ query: current_user.email }}

    it "returns search results of users by email" do
      get "/v1/search/email", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('username')
      expect(json.first).to have_key('id')
    end
  end

  describe "GET /v1/search/slot" do
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

  describe "GET /v1/search/media" do
    let(:slot) { create(:std_slot_public, :with_media, creator: current_user) }
    let(:query) {{ query: slot.media_items.first.title }}

    it "returns search results of media" do
      get "/v1/search/media", query, auth_header
      expect(response.status).to be(200)
      expect(json.first).to have_key('mediaId')
      expect(json.first).to have_key('mediaType')
    end
  end

  describe "GET /v1/search/group" do
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

  describe "GET /v1/search/location" do
    let!(:ios_location) { create(:ios_location, name: 'Alexanderplatz') }
    let(:query) {{ query: ios_location.name }}

    it "returns search results of media" do
      get "/v1/search/location", query, auth_header
      expect(response.status).to be(200)
      expect(json.length).to eq 1
      expect(json.first).to have_key('latitude')
      expect(json.first).to have_key('longitude')
    end
  end

  describe "GET /v1/search/user" do
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
