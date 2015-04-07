require 'documentation_helper'

resource "Users" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  post "/v1/users/signin" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :email, "Email of the user to authenticate", required: true
    parameter :password, "Password for the user to authenticate", required: true

    response_field :authToken, "Authentication Token for the user to be set" \
                               " as a HTTP header in subsequent requests"

    let(:user) { create(:user, password: "timeslot") }
    let(:email) { user.email }
    let(:password) { "timeslot" }

    example "User Signin", document: :v1 do
      explanation "returns OK and an AuthToken if credentials match\n\n" \
                  "returns 403 if credentials invalid"
      do_request

      expect(response_status).to eq(200)
      user.reload
      expect(json).to have_key "authToken"
      expect(json['authToken']).to eq user.auth_token
    end
  end

  # TODO: not ready for production!!! this needs email sending capability...
  post "/v1/users/reset-password" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :email, "Email of the user for whom to reset password",
              required: true

    let(:user) { create(:user, password: "nottimeslot") }
    let(:email) { user.email }

    example "Reset Password", document: :v1 do
      explanation "This is not ready for production!!!\n\n" \
                  "returns OK if valid email\n\n" \
                  "returns 403 if invalid email"
      do_request

      expect(response_status).to eq(200)
      user.reload

      # client.get(URI.parse(response_headers["location"]).path, {}, headers)
      # expect(status).to eq(200)
      # expect(json).to have_key "authToken"
      # expect(json['authToken']).to eq user.auth_token
    end
  end

  get "/v1/users/:id" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the user to get", required: true

    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :image, "URL of the user image"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"

    let(:id) { current_user.id }

    example "Get user returns user data", document: :v1 do
      explanation "returns 404 if ID is invalid\n\n"
      do_request

      expect(response_status).to eq(200)
      expect(
        json.except('image', 'friendships', 'friendsCount', 'reslotCount', 'slotCount', 'groups')
      ).to eq(current_user.attributes.as_json
               .except("auth_token", "password_digest", "role")
               .transform_keys { |key| key.camelize(:lower) })
    end
  end

  post "/v1/users" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :username, "Username of user (max. 50 characters)",
              required: true
    parameter :email, "Email of user (max. 254 characters)",
              required: true
    parameter :password, "Password for user (min. 5 & max. 72 characters)",
              required: true

    response_field :id, "ID of the new user"

    let(:username) { "foo" }
    let(:email) { "someone@timeslot.com" }
    let(:password) { "secret-thing" }

    example "User signup / Create user", document: :v1 do
      explanation "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key 'id'
      expect(json).to have_key 'username'
      expect(json).to have_key 'email'
      expect(json).to have_key 'authToken'

    end
  end

  patch "/v1/users" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    describe "Update current users data" do

      parameter :username, "Updated username of user (max. 50 characters)"
      parameter :defaultPrivateAlerts,
                "Default alerts for private slots of this user"
      parameter :defaultOwnFriendslotAlerts,
                "Default alerts for the friendslots of this user"
      parameter :defaultOwnPublicAlerts,
                "Default alerts for the public slots of this user"
      parameter :defaultFriendsFriendslotAlerts,
                "Default alerts for the friendslots from friends of this user"
      parameter :defaultFriendsPublicAlerts,
                "Default alerts for the public slots from friends of this user"
      parameter :defaultReslotAlerts,
                "Default alerts for the reslots of this user"
      parameter :defaultGroupAlerts,
                "Default alerts for all groupslots of this user" \
                " where no specific alert is set. Groupslots" \
                " may also have their own default alerts per group"

      let(:username) { "bar" }
      let(:defaultPrivateAlerts) { '0111011100' }

      example "Update current user", document: :v1 do
        explanation "E.g, change username and set default alerts\n\n" \
                    "returns user data\n\n" \
                    "returns 404 if ID is invalid\n\n" \
                    "returns 422 if parameters are missing\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        current_user.reload
        expect(current_user.username).to eq "bar"
        expect(current_user.default_private_alerts).to eq defaultPrivateAlerts
        expect(response_status).to eq(200)
        expect(
          json.except('image', 'friendships', 'friendsCount', 'reslotCount', 'slotCount', 'groups')
        ).to eq(current_user.attributes.as_json
                 .except("auth_token", "password_digest", "role")
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
    header "Authorization", :auth_header

    example "Delete current user", document: :v1 do
      explanation "Sets 'deletedAt' attr for user who is logged in" \
                  "Doesn't delete anything.\n\n" \
                  "returns user data"
      do_request

      current_user.reload
      expect(current_user.deleted_at).not_to be nil
      expect(response_status).to eq(200)
      expect(
        json.except('image', 'friendships', 'friendsCount', 'reslotCount', 'slotCount', 'groups')
      ).to eq(current_user.attributes.as_json
               .except("auth_token", "password_digest", "role")
               .transform_keys{ |key| key.camelize(:lower) })
    end
  end

  post "/v1/users/add_friends" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

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
    header "Authorization", :auth_header

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
