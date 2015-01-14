require 'documentation_helper'

resource "Users" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user) }
  before(:each) { ApplicationController.new.current_user = current_user }

  # at the moment this test is just here to explain the auth hack
  get "/v1/users/authenticate/:id" do
    header "Accept", "application/json"

    parameter :id, "ID of the user to authenticate", required: true

    let!(:first_user) { create(:user) } # should not be the current_user
    let(:user) { create(:user) }
    let(:id) { user.id }
    let(:testgroup) { attributes_for(:group) }

    # The best idea I had to check which user is set as current_user was taking
    # an action which uses the current_user and see if it gets set correctly
    example "Authenticate an user - See Note", document: :v1 do
      explanation "***Important***: as of now we don't have a proper user" \
                  " authentication in place. Please set a HTTP header" \
                  " with **'AUTHORIZATION'** as key and the **username**" \
                  " of the user who should be *logged in* as value.\n\n" \
                  "returns OK if User set as current user\n\n" \
                  "returns 404 if ID is invalid"
      do_request

      expect(response_status).to eq(200)

      client.post(URI.parse("/v1/groups").path, testgroup, headers)
      expect(status).to eq(201)
      expect(json['ownerId']).to eq user.id
    end
  end

  get "/v1/users/:id" do
    header "Accept", "application/json"

    parameter :id, "ID of the user to get", required: true

    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :image, "URL of the user image"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"

    let(:user) { create(:user) }
    let(:id) { user.id }
    let(:deleted_at) { user.deleted_at.nil? ? nil : user.deleted_at.iso8601 }

    example "Get user returns user data", document: :v1 do
      explanation "returns 404 if ID is invalid\n\n"
      do_request

      expect(response_status).to eq(200)
      expect(
        json.except('image')
      ).to eq(user.attributes.as_json
               .transform_keys { |key| key.camelize(:lower) })
    end
  end

  post "/v1/users" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :username, "Username of user (max. 20 characters)",
              required: true

    response_field :id, "ID of the new user"

    let(:username) { "foo" }

    example "Create user returns ID of new user", document: :v1 do
      explanation "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key("id")
    end
  end

  patch "/v1/users" do
    header "Content-Type", "application/json"

    describe "Update current users data" do

      parameter :username, "Updated username of user (max. 20 characters)"

      let(:username) { "bar" }

      example "Update current user", document: :v1 do
        explanation "E.g, change username\n\n" \
                    "returns user data\n\n" \
                    "returns 404 if ID is invalid\n\n" \
                    "returns 422 if parameters are missing\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        current_user.reload
        expect(current_user.username).to eq "bar"
        expect(response_status).to eq(200)
        expect(
          json.except('image')
        ).to eq(current_user.attributes.as_json
              .transform_keys { |key| key.camelize(:lower) })
      end
    end

    describe "Set image for User" do
      parameter :image, "Scope for attributes of new image",
                required: true
      parameter :publicId, "Cloudinary ID / URL",
                required: true,
                scope: :image

      response_field :image, "URL for this media item"

      let(:publicId) { "v1234567/xcvjghjkdisudgfds7iyf.jpg" }

      example "Set user image", document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary the client updates the group with the image" \
                    " information.\n\n" \
                    "returns 200 and the users data if the image was" \
                    " successfully added or updated"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key("image")
        expect(json["image"]).to eq publicId
        current_user.reload
        expect(current_user.image).not_to be nil
        expect(current_user.image.public_id).to eq publicId
      end
    end
  end

  delete "/v1/users" do
    example "Delete current user", document: :v1 do
      explanation "Sets 'deletedAt' attr for user who is logged in" \
                  "Doesn't delete anything.\n\n" \
                  "returns user data"
      do_request

      current_user.reload
      expect(current_user.deleted_at).not_to be nil
      expect(response_status).to eq(200)
      expect(
        json.except('image')
      ).to eq(current_user.attributes.as_json
               .transform_keys{ |key| key.camelize(:lower) })
    end
  end

  post "/v1/users/add_friends" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :ids, "Array of User IDs to create a friendship for",
              required: true

    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let!(:friendship) { create(:friendship, user: john, friend: current_user) }
    let!(:friendship2) {
      create(:friendship, :established, user: current_user, friend: mary) }

    let!(:friend_requests) { create_list(:user, 3) }
    let(:ids) { [john.id, mary.id, alice.id] + friend_requests.collect(&:id) }

    example "Add Friends",
            document: :v1 do
      explanation "Receives a list of User IDs for which a friendship" \
                  "with the current user will be created.\n\n" \
                  "This corresponds to a 'Friend Request'.\n\n" \
                  "If the friendship was already initiated by the other User" \
                  " it will be accepted.\n\n" \
                  # "returns a list of all User IDs for which a friendship was" \
                  # " created (request of fully established)\n\n." \
                  "returns 404 if an User ID is invalid"

      do_request

      expect(status).to be 200
      expect(current_user.friends).to include john
      expect(current_user.friends).to include mary
      expect(current_user.requested_friends).to include alice
      expect(current_user.requested_friends).not_to include john
      expect(current_user.requested_friends).not_to include mary
      expect(current_user.requested_friends.size).to eq 4
    end
  end

  post "/v1/users/remove_friends" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :ids, "Array of User IDs for whom to refuse/destroy a friendship",
              required: true

    let(:john) { create(:user, username: "John") }
    let(:mary) { create(:user, username: "Mary") }
    let(:alice) { create(:user, username: "Alice") }
    let(:bob) { create(:user, username: "Bob") }
    let!(:friend_request) {
      create(:friendship, user: current_user, friend: bob) }
    let!(:friend_offer) {
      create(:friendship, user: john, friend: current_user) }
    let!(:friendship) {
      create(:friendship, :established, user: current_user, friend: mary) }

    let(:ids) { [john.id, mary.id, alice.id, bob.id] }

    example "Remove Friends/Refuse Friend requests",
            document: :v1 do
      explanation "Receives a list of User IDs for which a friendship" \
                  "with the current user will be refused or deleted.\n\n" \
                  "returns 404 if an User ID is invalid"

      do_request

      expect(status).to be 200
      current_user.reload
      expect(current_user.friends).not_to include john
      expect(current_user.requested_friends).not_to include bob
      expect(current_user.friends).not_to include mary
      expect(current_user.friends).not_to include alice
    end
  end
end
