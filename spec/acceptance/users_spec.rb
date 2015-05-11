require 'documentation_helper'

resource "Users" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  get "/v1/users/:id" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the user to get", required: true

    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :image, "URL of the user image"
    response_field :locationId, "Home location of user"
    response_field :push, "Send push Notifications (true/false)"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"
    response_field :slotCount, "Number of slots for this user"
    response_field :reslotCount, "Number of reslots for this user"
    response_field :friendsCount, "Number of friends for this user"

    context "own data" do
      response_field :email, "Email of user (max. 255 characters)"
      response_field :phone, "Phone number of user (max. 35 characters)"
      response_field :publicUrl, "Public URL for user on Timeslot (max. 255 chars)"
      response_field :slotDefaultDuration, "Default Slot Duration in seconds"
      response_field :slotDefaultTypeId, "Default Slot Type - WIP"
      response_field :slotDefaultLocationId, "Default Slot Location ID - WIP"
      response_field :defaultPrivateAlerts,
                     "Default alerts for private slots of this user"
      response_field :defaultOwnFriendslotAlerts,
                     "Default alerts for the friendslots of this user"
      response_field :defaultOwnPublicAlerts,
                     "Default alerts for the public slots of this user"
      response_field :defaultFriendsFriendslotAlerts,
                     "Default alerts for the friendslots from friends of this user"
      response_field :defaultFriendsPublicAlerts,
                     "Default alerts for the public slots from friends of this user"
      response_field :defaultReslotAlerts,
                     "Default alerts for the reslots of this user"
      response_field :defaultGroupAlerts,
                     "Default alerts for all groupslots of this user" \
                     " where no specific alert is set. Groupslots" \
                     " may also have their own default alerts per group"
      response_field :friendships, "all connections to other users"
      response_field :memberships, "all connections to groups"

      let(:id) { current_user.id }

      example "Get own user data", document: :v1 do
        explanation "returns 404 if ID is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key "id"
        expect(json).to have_key "username"
        expect(json).to have_key "image"
        expect(json).to have_key "locationId"
        expect(json).not_to have_key "push" # wip
        expect(json).to have_key "createdAt"
        expect(json).to have_key "updatedAt"
        expect(json).to have_key "deletedAt"
        expect(json).to have_key "slotCount"
        expect(json).to have_key "reslotCount"
        expect(json).to have_key "friendsCount"
        expect(json).to have_key "defaultPrivateAlerts"
        expect(json).to have_key "slotDefaultDuration"
        expect(json).not_to have_key "authToken"
        expect(json).not_to have_key "passwordDigest"
        expect(json).not_to have_key "role"

        expect(
          json.except('image', 'friendships', 'friendsCount', 'reslotCount',
                      'slotCount', 'memberships')
        ).to eq(current_user.attributes.as_json
                 .except("auth_token", "password_digest", "role", "push")
                 .transform_keys { |key| key.camelize(:lower) })
      end
    end

    context "other user" do
      let(:user) { create(:user) }
      let(:id) { user.id }

      example "Get other users data", document: :v1 do
        explanation "returns 404 if ID is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key "id"
        expect(json).to have_key "username"
        expect(json).to have_key "image"
        expect(json).to have_key "locationId"
        # expect(json).to have_key "notifications"
        expect(json).to have_key "createdAt"
        expect(json).to have_key "updatedAt"
        expect(json).to have_key "deletedAt"
        expect(json).to have_key "slotCount"
        expect(json).to have_key "reslotCount"
        expect(json).to have_key "friendsCount"
        expect(json).not_to have_key "authToken"
        expect(json).not_to have_key "passwordDigest"
        expect(json).not_to have_key "role"
        expect(
          json.except('image', 'friendsCount', 'reslotCount', 'slotCount')
        ).to eq(user.attributes.as_json
                 .except("auth_token", "password_digest", "role", 'public_url',
                         'push', 'email', 'email_verified', 'phone', 'phone_verified',
                         'default_private_alerts', 'default_own_friendslot_alerts',
                         'default_own_public_alerts', 'default_friends_friendslot_alerts',
                         'default_friends_public_alerts', 'default_reslot_alerts',
                         'default_group_alerts', 'slot_default_duration',
                         'slot_default_type_id', 'slot_default_location_id'
                        )
                 .transform_keys { |key| key.camelize(:lower) })
      end
    end
  end

  post "/v1/users" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :username, "Username of user (max. 50 characters)",
              required: true
    parameter :email, "Email of user (max. 254 characters)"
    parameter :phone, "Phone number of user (max. 35 characters)"
    parameter :password, "Password for user (min. 5 & max. 72 characters)",
              required: true

    response_field :id, "ID of the new user"

    let(:username) { "foo" }
    let(:email) { "someone@timeslot.com" }
    let(:password) { "secret-thing" }

    example "User signup / Create user", document: :v1 do
      explanation "Either an email or phone number must be provided\n\n" \
                  "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key 'id'
      expect(json).to have_key 'username'
      expect(json).to have_key 'email'
      expect(json).to have_key 'authToken'
    end
  end

  post "/v1/users/signin" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :email, "Email of the user to authenticate", required: true
    parameter :password, "Password for the user to authenticate", required: true

    response_field :authToken, "Authentication Token for the user to be set" \
                               " as a HTTP header in subsequent requests"

    let(:user) { create(:user, :with_email, password: "timeslot") }
    let(:email) { user.email }
    let(:password) { "timeslot" }

    example "User signin", document: :v1 do
      explanation "returns OK and an AuthToken if credentials match\n\n" \
                  "returns 403 if credentials invalid"
      do_request

      expect(response_status).to eq(200)
      user.reload
      expect(json).to have_key "authToken"
      expect(json['authToken']).to eq user.auth_token
    end
  end

  get "/v1/users/signout" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    example "User signout", document: :v1 do
      explanation "returns OK if current user was successfully signed out\n\n" \
                  "returns 403 if there was no current user"
      do_request

      expect(response_status).to eq(200)
      current_user.reload
      expect(current_user.auth_token).to be nil
    end
  end

  # TODO: not ready for production!!! this needs email sending capability...
  post "/v1/users/reset" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :email, "Email of the user for whom to reset password",
              required: true

    let(:user) { create(:user, :with_email, password: "nottimeslot") }
    let(:email) { user.email }

    example "Reset password", document: :v1 do
      explanation "This is not ready for production!!!\n\n" \
                  "Resets password to 'autechre'\n\n" \
                  "returns OK if valid email\n\n" \
                  "returns 403 if invalid email"
      do_request

      expect(response_status).to eq(200)

      no_doc do
        # the Content-Type should be 'application/json',
        # but is 'application/x-www-form-urlencoded'
        client.post "v1/users/signin", { email: user.email, password: 'autechre' }
        user.reload
        expect(status).to eq(200)
        expect(json).to have_key "authToken"
        expect(json['authToken']).to eq user.auth_token
      end
    end
  end

  patch "/v1/users" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    describe "Update current users data" do

      parameter :username, "Updated username of user (max. 50 characters)"
      parameter :email, "Email of user (max. 255 characters)"
      parameter :phone, "Phone number of user (max. 35 characters)"
      parameter :locationId, "Home location of user"
      parameter :image, "URL of the user image"
      parameter :publicUrl, "Public URL for user on Timeslot (max. 255 chars)"
      parameter :push, "Send push Notifications (true/false)"
      parameter :slotDefaultDuration, "Default Slot Duration in seconds"
      parameter :slotDefaultTypeId, "Default Slot Type - WIP"
      parameter :slotDefaultLocationId, "Default Slot Location ID - WIP"
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

      example "Update current user - change username and default alerts",
              document: :v1 do
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
          json.except('image', 'friendships', 'friendsCount', 'reslotCount',
                      'slotCount', 'memberships')
        ).to eq(current_user.attributes.as_json
                 .except("auth_token", "password_digest", "role", 'push')
                 .transform_keys { |key| key.camelize(:lower) })
      end
    end

    describe "Update password for User" do
      parameter :password, "new password", required: true
      parameter :old_password, "valid old password", required: true

      let(:password) { "slimetot" }
      let(:old_password) { "timeslot" }

      example "Update current user - update password", document: :v1 do
        explanation "The valid old password needs to be send along\n\n" \
                    "returns 200 and the users data if the password was" \
                    " successfully updated"
        do_request

        expect(response_status).to eq(200)
        current_user.reload
        expect(current_user.password_digest).not_to be nil
        expect(current_user.try(:authenticate, 'slimetot')).to eq current_user
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

      example "Update current user - set user image", document: :v1 do
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
    end
  end

  get "/v1/users/:id/slots" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    response_field :id, "ID of the slot"
    response_field :title, "Title of the slot"
    response_field :startDate, "Startdate of the slot"
    response_field :endDate, "Enddate of the slot"
    response_field :creatorId, "ID of the User who created the slot"
    response_field :alerts, "Alerts for the slot for the current user"
    response_field :notes, "A list of all notes on the slot"
    response_field :likes, "Number of likes for the slot"
    response_field :commentsCounter, "Number of comments on the slot"
    response_field :photos, "Photos for the slot"
    response_field :voices, "Voice recordings for the slot"
    response_field :videos, "Videos for the slot"
    response_field :url, "direct url to fetch the slot"
    response_field :visibility, "Visibility if it's a StandardSlot"
    response_field :createdAt, "Creation datetime of the slot"
    response_field :updatedAt, "Last update of the slot"
    response_field :deletedAt, "Deletion datetime of the slot"

    describe "Get slots for current user" do
      let(:id) { current_user.id }

      let!(:std_slot_1) { create(:std_slot_private, owner: current_user) }
      let!(:std_slot_2) { create(:std_slot_friends, owner: current_user) }
      let!(:re_slots) { create_list(:re_slot, 2, slotter: current_user) }

      example "Get slots for current user", document: :v1 do
        explanation "Returns an array which includes StandardSlots &" \
                    " ReSlots\n\n" \
                    "If a user is authenticated the slot settings" \
                    " (alerts) will be included."
        do_request

        expect(response_status).to eq(200)
        slot_count = StdSlot.of(current_user).count +
                     current_user.re_slots.count
        expect(json.length).to eq slot_count
        expect(json.first).to have_key("id")
        expect(json.first).to have_key("title")
        expect(json.first).to have_key("locationId")
        expect(json.first).to have_key("startDate")
        expect(json.first).to have_key("endDate")
        expect(json.first).to have_key("settings")
        expect(json.first).to have_key("createdAt")
        expect(json.first).to have_key("updatedAt")
        expect(json.first).to have_key("deletedAt")
        expect(json.first).to have_key("creatorId")
        expect(json.first).to have_key("notes")
        expect(json.first).to have_key("likes")
        expect(json.first).to have_key("commentsCounter")
        expect(json.first).to have_key("visibility")
        expect(json.first).to have_key("photos")
        expect(json.first).to have_key("voices")
        expect(json.first).to have_key("videos")
        expect(json.first).to have_key("url")
        expect(json)
          .to include("id" => std_slot_1.id,
                      "title" => std_slot_1.title,
                      "locationId" => std_slot_1.location_id,
                      "startDate" => std_slot_1.start_date.as_json,
                      "endDate" => std_slot_1.end_date.as_json,
                      "createdAt" => std_slot_1.created_at.as_json,
                      "updatedAt" => std_slot_1.updated_at.as_json,
                      "deletedAt" => std_slot_1.deleted_at,
                      "settings" => {
                        'alerts' => current_user.alerts(std_slot_1) },
                      "notes" => std_slot_1.notes,
                      "likes" => std_slot_1.likes.count,
                      "commentsCounter" => std_slot_1.comments.count,
                      "photos" => std_slot_1.photos,
                      "voices" => std_slot_1.voices,
                      "videos" => std_slot_1.videos,
                      "visibility" => std_slot_1.visibility,
                      "url" => v1_slot_url(std_slot_1, format: :json),
                      "creatorId" => std_slot_1.creator.id
                     )
      end
    end

    describe "Get slots for other user" do
      let(:joe) { create(:user, username: "Joe") }
      let(:id) { joe.id }

      let!(:std_slot_secret) { create(:std_slot_private, owner: joe) }
      let!(:std_slot_friend) { create(:std_slot_friends, owner: joe) }
      let!(:std_slot_public) { create(:std_slot_public, owner: joe) }
      let!(:re_slots) { create(:re_slot, slotter: joe) }
      let(:incommon_groupslot) { create(:group_slot) }

      describe "befriended user" do
        let!(:friendship) {
          create(:friendship, :established, user: joe, friend: current_user) }
        let(:groupslot) { create(:group_slot) }
        let!(:memberships) {
          create(:membership, :active, group: groupslot.group, user: current_user)
          create(:membership, :active, group: groupslot.group, user: joe)
          create(:membership, :active, group: incommon_groupslot.group, user: joe)
        }

        example "Get slots for befriended user", document: :v1 do
          explanation "Returns an array which includes StandardSlots with" \
                      " visibility 'friend' or 'public', ReSlots & shared" \
                      " GroupSlots\n\n" \
                      "If a user is authenticated the slot settings" \
                      " (alerts) will be included."
          do_request

          expect(response_status).to eq(200)
          slot_count = joe.std_slots_friends.count +
                       joe.std_slots_public.count +
                       current_user.shared_group_slots(joe).count +
                       joe.re_slots.count
          expect(json.length).to eq slot_count
          expect(json.first).to have_key("id")
          expect(response_body).not_to include std_slot_secret.title
          expect(response_body).to include std_slot_friend.title
          expect(response_body).to include std_slot_public.title
          expect(response_body).to include groupslot.title
          expect(response_body).not_to include incommon_groupslot.title
        end
      end

      describe "unrelated user with common groups" do
        let(:groupslot) { create(:group_slot) }
        let!(:memberships) {
          create(:membership, :active, group: groupslot.group, user: current_user)
          create(:membership, :active, group: groupslot.group, user: joe)
          create(:membership, :active, group: incommon_groupslot.group, user: joe)
        }

        example "Get slots of unrelated user with common groups",
                document: :v1 do
          explanation "Returns an array which includes StandardSlots with" \
                      " visibility 'public', 'public'-ReSlots & shared" \
                      " GroupSlots\n\n" \
                      "If a user is authenticated the slot settings" \
                      " (alerts) will be included."
          do_request

          expect(response_status).to eq(200)
          slot_count = joe.std_slots_public.count +
                       joe.re_slots.count +
                       current_user.shared_group_slots(joe).count
          expect(json.length).to eq slot_count
          expect(json.first).to have_key("id")
          expect(response_body).not_to include std_slot_secret.title
          expect(response_body).not_to include std_slot_friend.title
          expect(response_body).to include std_slot_public.title
          expect(response_body).to include groupslot.title
          expect(response_body).not_to include incommon_groupslot.title
        end
      end

      describe "unrelated user" do
        example "Get slots of unrelated user", document: :v1 do
          explanation "Returns an array which includes StandardSlots with" \
                      " visibility 'public' and 'public'-ReSlots\n\n" \
                      "If a user is authenticated the slot settings" \
                      " (alerts) will be included."
          do_request

          expect(response_status).to eq(200)
          slot_count = joe.std_slots_public.count + joe.re_slots.count
          expect(json.length).to eq slot_count
          expect(response_body).not_to include std_slot_secret.title
          expect(response_body).not_to include std_slot_friend.title
          expect(response_body).to include std_slot_public.title
          expect(response_body).not_to include incommon_groupslot.title
        end
      end
    end
  end

  get "/v1/users/friendslots" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    response_field :id, "ID of the slot"
    response_field :title, "Title of the slot"
    response_field :startDate, "Startdate of the slot"
    response_field :endDate, "Enddate of the slot"
    response_field :creatorId, "ID of the User who created the slot"
    response_field :alerts, "Alerts for the slot for the current user"
    response_field :notes, "A list of all notes on the slot"
    response_field :likes, "Number of likes for the slot"
    response_field :commentsCounter, "Number of comments on the slot"
    response_field :photos, "Photos for the slot"
    response_field :voices, "Voice recordings for the slot"
    response_field :videos, "Videos for the slot"
    response_field :url, "direct url to fetch the slot"
    response_field :visibility, "Visibility if it's a StandardSlot"
    response_field :createdAt, "Creation datetime of the slot"
    response_field :updatedAt, "Last update of the slot"
    response_field :deletedAt, "Deletion datetime of the slot"

    let(:bob) { create(:user, :with_private_slot) }
    let!(:re_slot) { create(:re_slot, slotter: bob) }
    let!(:friendships) {
      create(:friendship, :established, user: bob, friend: current_user)
      create(:friendship, :established, user: create(:user, :with_friend_slot),
             friend: current_user)
      create(:friendship, :established, user: create(:user, :with_public_slot),
             friend: current_user)
    }
    let(:id) { current_user.id }

    example "Get slots of current users friends", document: :v1 do
      explanation "Returns an array which includes the public and" \
                  " friend-visible StandardSlots &" \
                  " ReSlots of all friends from the current user"
      do_request

      expect(response_status).to eq(200)
      slot_count = 0
      current_user.friends.each do |friend|
        slot_count += friend.std_slots_friends.count
        slot_count += friend.std_slots_public.count
        slot_count += friend.re_slots.count
      end
      expect(json.length).to eq slot_count
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

    example "Add Friends - Request Friendship / Accept Friend Request",
            document: :v1 do
      explanation "Receives a list of User IDs for which a friendship" \
                  "with the current user will be created.\n\n" \
                  "This corresponds to a 'Friend Request'.\n\n" \
                  "If the friendship was already initiated by the other User" \
                  " it will be accepted.\n\n" \
                  # "returns a list of all User IDs for which a friendship was" \
                  # " created (requested or fully established)\n\n." \
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

    example "Remove Friends - Unfriending / Refuse Friend Requests",
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
