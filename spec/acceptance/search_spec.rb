# coding: utf-8
require 'documentation_helper'

resource "Search" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  # get valid elastic search categories
  get "/v1/search/categories", :vcr do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    example "Get list of all search categories", document: :v1 do
      explanation "Returns a list of all valid values for the " \
                  "'category' parameter for searching."
      do_request

      expect(response_status).to eq(200)
      expect(json).to have_key("categories")
      categories = json['categories']
      # expect(categories.sort).to include "football"
      expect(categories.sort).to include "cinema"
      expect(categories.sort).to include "concerts"
      expect(categories.sort).to include "television"
      expect(categories.sort).to include "calendars"
      expect(categories.sort).to include "clubbing"
    end
  end

  # search users
  get "/v1/search/user" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :query, "The query of the search", required: true

    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :image, "URL of the user image"
    # response_field :location, "Home location of user"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"
    # response_field :slotCount, "Number of slots for this user"
    # response_field :reslotCount, "Number of reslots for this user"
    # response_field :friendsCount, "Number of friends for this user"
    response_field :friendshipState,
                   "The friendship relation to the current user"

    context "search by username" do
      let!(:user) { create(:user, username: 'John Doe') }
      let(:query) { 'john doe' }

      example "Search by username", document: :v1 do
        explanation "returns 404 if query is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to be 1
        expect(json.first).to have_key "id"
        expect(json.first).to have_key "username"
        expect(json.first).to have_key "image"
        expect(json.first).to have_key "friendshipState"
        expect(json.first['id']).to eq(user.id)
      end
    end

    context "search by custom attribute" do
      parameter :attr, "The custom search attribute"

      let!(:user) {
        create(:user, username: 'John Doe', email: 'john_doe@email.com') }
      let(:query) { 'john_doe@email.com' }
      let(:attr) { 'email' }

      example "Search by custom attribute", document: :v1 do
        explanation "returns 404 if query is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to be 1
        expect(json.first).to have_key "id"
        expect(json.first).to have_key "username"
        expect(json.first).to have_key "image"
        expect(json.first).to have_key "friendshipState"
        expect(json.first['id']).to eq(user.id)
      end
    end

    context "search by custom search algorithm" do
      parameter :method, "The custom search algorithm"

      let!(:user1) { create(:user, username: 'John Doe') }
      let!(:user2) { create(:user, username: 'John Doh') }
      let(:query) { 'jon do' }
      let(:method) { 'metaphone' }

      example "Search by custom search algorithm", document: :v1 do
        explanation "returns 404 if query is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to be 2
        expect(json.first).to have_key "id"
        expect(json.first).to have_key "username"
        expect(json.first).to have_key "image"
        expect(json.first).to have_key "friendshipState"
        expect(json.first['id']).to eq(user1.id)
        expect(json.last['id']).to eq(user2.id)
      end
    end
  end

  # search friends
  get "/v1/search/friend" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :query, "The query of the search", required: true

    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :image, "URL of the user image"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"
    response_field :friendshipState,
                   "The friendship relation to the current user"

    context "search friend by username" do
      let!(:user) { create(:user, username: 'Johnny Doehl') }
      let!(:friend) { create(:user, username: 'John Doe') }
      let!(:friendship) { create(:friendship, :established,
                                 friend: friend, user: current_user)}
      let(:query) { 'john' }

      example "Search friend by username", document: :v1 do
        explanation "returns 404 if query is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to be(1)
        expect(json.first).to have_key("id")
        expect(json.first).to have_key("username")
        expect(json.first).to have_key("image")
        expect(json.first).to have_key("friendshipState")
        expect(json.first['friendshipState']).to eq('friend')
        expect(json.first['id']).to eq(friend.id)
      end
    end
  end

  # search slots
  get "/v1/search/slot" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :query, "The query of the search", required: true

    response_field :id, "ID of the slot"
    response_field :title, "Title of the slot"
    response_field :startDate, "Startdate of the slot"
    response_field :endDate, "Enddate of the slot"
    response_field :createdAt, "Creation of slot"
    response_field :updatedAt, "Last update of slot"
    response_field :deletedAt, "Delete date of slot or nil"
    response_field :location, "Location data for the slot"
    response_field :creator, "User who created the slot"

    context "search by slot title" do
      let!(:slot) { create(:std_slot_public,
                           creator: current_user,
                           title: 'Timeslot Party Berlin 2015') }
      let(:query) { 'timeslot 2015' }

      example "Search by slot title", document: :v1 do
        explanation "returns 404 if query is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to be 1
        expect(json.first).to have_key "id"
        expect(json.first).to have_key("title")
        expect(json.first).to have_key("startDate")
        expect(json.first).to have_key("endDate")
        expect(json.first).to have_key("location")
        expect(json.first).to have_key("creator")
        expect(json.first).to have_key("createdAt")
        expect(json.first).to have_key("updatedAt")
        expect(json.first).to have_key("deletedAt")
        expect(json.first).to have_key("notes")
        expect(json.first).to have_key("likes")
        expect(json.first).to have_key("commentsCounter")
        expect(json.first).to have_key("visibility")
        expect(json.first['title']).to eq("Timeslot Party Berlin 2015")
      end
    end
  end

  # search medias
  get "/v1/search/media" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :query, "The query of the search", required: true

    response_field :signature, "Signature for cloudinary upload"
    response_field :pulicId, "ID for the resource to be uploaded"
    response_field :timestamp, "Timestamp"
    response_field :apiKey, "API Key"

    context "search by media title" do
      let!(:video) { create(:video,
                            creator: current_user,
                            title: 'Timeslot Party Berlin 2015') }
      let(:query) { 'timeslot 2015' }

      example "Search by media title", document: :v1 do
        explanation "returns 404 if query is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to be 1
        expect(json.first).to have_key("mediaId")
        expect(json.first).to have_key("publicId")
        expect(json.first).to have_key("position")
        expect(json.first).to have_key("localId")
        expect(json.first).to have_key("mediaType")
        expect(json.first).to have_key("createdAt")
        expect(json.first).to have_key("duration")
        expect(json.first).to have_key("thumbnail")
        expect(json.first['localId']).to eq(video.local_id)
      end
    end
  end

  # search locations
  get "/v1/search/location" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :query, "The query of the search", required: true

    response_field :id, "ID of the location"
    response_field :name, "name of the location"

    context "search by location name" do
      let!(:location) {
        create(:ios_location, name: 'Timeslot Friedrichstraße 110 (Berlin)') }
      let(:query) { 'timeslot berlin' }

      example "Search by location name", document: :v1 do
        explanation "returns 404 if query is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json.length).to be 1
        expect(json.first).to have_key("id")
        expect(json.first).to have_key("name")
        expect(json.first).to have_key("thoroughfare")
        expect(json.first).to have_key("subThoroughfare")
        expect(json.first).to have_key("locality")
        expect(json.first).to have_key("subLocality")
        expect(json.first).to have_key("administrativeArea")
        expect(json.first).to have_key("subAdministrativeArea")
        expect(json.first).to have_key("postalCode")
        expect(json.first).to have_key("country")
        expect(json.first).to have_key("isoCountryCode")
        expect(json.first).to have_key("inLandWater")
        expect(json.first).to have_key("ocean")
        expect(json.first).to have_key("areasOfInterest")
        expect(json.first).to have_key("latitude")
        expect(json.first).to have_key("longitude")
        # expect(json.first).to have_key("privateLocation")
        expect(json.first['name']).to eq("Timeslot Friedrichstraße 110 (Berlin)")
      end
    end
  end

  get "/v1/globalslots/search", :vcr do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :category,
              "Basic slot category to search in. Valid categories are eg.: " \
              "[cinema, soccer, concerts, clubbing, television]",
              required: true
    parameter :q, "String to search global slots for", required: true
    parameter :moment, "find results after this datetime, default: Time.now"
    parameter :limit, "maximum number of results, default: 20"

    describe "cinema" do
      let(:category) { 'cinema' }
      let(:q) { 'Man' }
      let(:moment) { '2016-04-29T12:43:28.907Z' }
      let(:limit) { 7 }

      example "Cinema - Find global slots", document: :v1 do
        explanation "Forwards a search request to the Elastic Search Service " \
                    "for global slots from the data team.\n\n" \
                    "returns 422 if parameters invalid"
        skip 'movie pilot is having issues'
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("result")
        expect(json['result']).to have_key(category)
        expect(json['result'][category]).to have_key("slots")

        result = json['result'][category]['slots']
        expect(result.length).to eq limit

        first = result.first
        expect(first).to have_key("muid")
        expect(first).to have_key("title")
        expect(first).to have_key("startDate")
        # expect(first).to have_key("endDate")
        # expect(first).to have_key("image")
        expect(first).to have_key("location")
        expect(first['location']).to have_key("name")
        expect(first['location']).to have_key("thoroughfare")
        expect(first['location']).to have_key("locality")
        expect(first['location']).to have_key("country")
        expect(first['location']).to have_key("latitude")
        expect(first['location']).to have_key("longitude")
        expect(first).to have_key("sources")
        expect(first['sources'].first).to have_key("name")
        expect(first['sources'].first).to have_key("url")
        expect(first['sources'].first).to have_key("image")

        expect(first).not_to have_key("id")
        expect(first).not_to have_key("settings")
        expect(first).not_to have_key("createdAt")
        expect(first).not_to have_key("updatedAt")
        expect(first).not_to have_key("deletedAt")
        expect(first).not_to have_key("likes")
        expect(first).not_to have_key("commentsCounter")
        expect(first).not_to have_key("reslotsCounter")
        expect(first).not_to have_key("visibility")
      end
    end

    describe "concerts" do
      let(:category) { 'concerts' }
      let(:q) { 'proje' }
      let(:moment) { '2016-04-05' }
      let(:limit) { 5 }

      example "Concerts - Find global slots", document: :v1 do
        explanation "Forwards a search request to the Elastic Search Service " \
                    "for global slots from the data team.\n\n" \
                    "returns 422 if parameters invalid"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("result")
        expect(json['result']).to have_key(category)
        expect(json['result'][category]).to have_key("slots")

        result = json['result'][category]['slots']
        expect(result.length).to eq limit

        first = result.first
        expect(first).to have_key("muid")
        expect(first).to have_key("title")
        expect(first).to have_key("startDate")
        # expect(first).to have_key("endDate")
        # expect(first).to have_key("image")
        expect(first).to have_key("location")
        expect(first['location']).to have_key("name")
        expect(first['location']).to have_key("thoroughfare")
        expect(first['location']).to have_key("locality")
        expect(first['location']).to have_key("country")
        expect(first['location']).to have_key("latitude")
        expect(first['location']).to have_key("longitude")
        expect(first).to have_key("sources")
        expect(first['sources'].first).to have_key("name")
        expect(first['sources'].first).to have_key("url")
        expect(first['sources'].first).to have_key("image")

        expect(first).not_to have_key("id")
        expect(first).not_to have_key("settings")
        expect(first).not_to have_key("createdAt")
        expect(first).not_to have_key("updatedAt")
        expect(first).not_to have_key("deletedAt")
        expect(first).not_to have_key("likes")
        expect(first).not_to have_key("commentsCounter")
        expect(first).not_to have_key("reslotsCounter")
        expect(first).not_to have_key("visibility")
      end
    end
  end
end
