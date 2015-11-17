require 'documentation_helper'

resource "Users" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password, :with_device) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  shared_context "default user response fields" do
    response_field :id, "ID of the user"
    response_field :username, "Username of the user"
    response_field :image, "URL of the user image"
    response_field :location, "Home location of user"
    response_field :push, "Send push Notifications (true/false)"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"
    response_field :slotCount, "Number of slots for this user"
    response_field :reslotCount, "Number of reslots for this user"
    response_field :friendsCount, "Number of friends for this user"
  end

  shared_context "current user response fields" do
    include_context "default user response fields"

    response_field :email, "Email of user (max. 255 characters)"
    response_field :phone, "Phone number of user (max. 35 characters)"
    response_field :lang, "Language code (ISO 639-1)"
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
    response_field :devices, "all devices from user"
  end

  get "/v1/users/:id" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the user to get", required: true

    context "own data" do
      include_context "current user response fields"

      let(:id) { current_user.id }

      example "Get own user data", document: :v1 do
        explanation "returns 404 if ID is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key "id"
        expect(json).to have_key "username"
        expect(json).to have_key "image"
        expect(json).to have_key "location"
        expect(json).to have_key "push"
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
        # TODO: change in step2 of user image refactoring
        expect(
          json.except('image', 'friendships', 'friendsCount', 'reslotCount',
                      'slotCount', 'memberships', 'location')
        ).to eq(current_user.attributes.as_json
                 .except("auth_token", "password_digest", "role",
                         "picture",
                         "device_token", "location_id")
                 .transform_keys { |key| key.camelize(:lower) })
        expect(json['location']).to eq nil
      end
    end

    context "other user" do
      include_context "default user response fields"

      let(:user) { create(:user, :with_location) }
      let(:id) { user.id }

      example "Get other users data", document: :v1 do
        explanation "returns 404 if ID is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        expect(json).to have_key "id"
        expect(json).to have_key "username"
        expect(json).to have_key "image"
        expect(json).to have_key "location"
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
        # TODO: change in step2 of user image refactoring
        expect(
          json.except('image', 'friendsCount', 'reslotCount', 'slotCount', 'location')
        ).to eq(user.attributes.as_json
                 .except("auth_token", "password_digest", "role", 'public_url',
                         'push', 'device_token', 'email', 'email_verified', 'lang',
                         'picture',
                         'phone', 'phone_verified', 'location_id',
                         'default_private_alerts', 'default_own_friendslot_alerts',
                         'default_own_public_alerts', 'default_friends_friendslot_alerts',
                         'default_friends_public_alerts', 'default_reslot_alerts',
                         'default_group_alerts', 'slot_default_duration',
                         'slot_default_type_id', 'slot_default_location_id'
                        )
                 .transform_keys { |key| key.camelize(:lower) })
        expect(json['location']['name']).to eq "Acapulco"
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
    parameter :lang, "Language of user (2 characters, ISO 639-1)"
    parameter :password, "Password for user (min. 5 & max. 72 characters)",
              required: true

    include_context "current user response fields"
    response_field :authToken, "Authentication Token for the user to be set" \
                               " as a HTTP header in subsequent requests"
    let(:username) { "foo" }
    let(:email) { "someone@timeslot.com" }
    let(:password) { "secret-thing" }
    let(:lang) { "de" }

    example "User signup - Create user", document: :v1 do
      explanation "Either an email or phone number must be provided\n\n" \
                  "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key 'id'
      expect(json).to have_key 'username'
      expect(json).to have_key 'email'
      expect(json).to have_key 'lang'
      expect(json).to have_key 'authToken'
    end

    context "Signup and create user with a specific device" do
      parameter :device,
                "A key-value-paired array which describes the device, " \
                "e.g. device = { system: 'ios', version: '6.0b'," \
                " deviceId: 'xxx-xxxx-xxx' }", required: true
      parameter :system,
                "A string shorthand of the current device operating system" \
                " (max. 10 chars), e.g.: 'ios', 'android' ",
                scope: :device, required: true
      parameter :version,
                "A string for the version of the current device operating" \
                " system (max. 10 chars), e.g.: '6.0b' ",
                scope: :device, required: true
      parameter :deviceId,
                "A unique hardware ID from the current device (max. 128 chars)",
                scope: :device, required: true

      let(:user) { create(:user) }
      let(:id) { user[:id] }
      let(:device) {{ device: attributes_for(:device) }}

      example "User signup - Create user with a specific device",
              document: :v1 do
        explanation "Either an email or phone number must be provided\n\n" \
                    "returns 422 if parameters are missing\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        expect(response_status).to eq(201)
        expect(json).to have_key 'id'
        expect(json).to have_key 'username'
        expect(json).to have_key 'email'
        expect(json).to have_key 'authToken'
        expect(json).to have_key 'push'
      end
    end
  end

  post "/v1/users/signin", :vcr do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :email, "Email of the user to authenticate", required: true
    parameter :password, "Password for the user to authenticate", required: true

    include_context "current user response fields"
    response_field :authToken, "Authentication Token for the user to be set" \
                               " as a HTTP header in subsequent requests"

    let(:user) { create(:user, :with_email, password: "timeslot") }
    let(:email) { user.email }
    let(:password) { "timeslot" }

    example "User signin", document: :v1 do
      explanation "returns OK and an AuthToken if credentials match\n\n" \
                  "returns 401 if credentials invalid"
      do_request

      expect(response_status).to eq(200)
      user.reload
      expect(json).to have_key "authToken"
      expect(json['authToken']).to eq user.auth_token
    end

    context "User signin with new device" do
      parameter :device, "A key-value-paired array which describes the device, " \
                         "e.g. device = { system: 'ios', version: '6.0b', deviceId: 'xxx-xxxx-xxx' }", required: true
      parameter :system, "A string shorthand of the current device operating system (max. 10 chars), e.g.: 'ios', 'android' ",
                scope: :device, required: true
      parameter :version, "A string for the version of the current device operating system (max. 10 chars), e.g.: '6.0b' ",
                scope: :device, required: true
      parameter :deviceId, "A unique hardware ID from the current device (max. 128 chars) ",
                scope: :device, required: true

      let(:device) {{ device: attributes_for(:device) }}

      example "User signin with new device", document: :v1 do
        explanation "returns OK and an AuthToken if credentials match\n\n" \
                    "returns 401 if credentials invalid"
        do_request

        expect(response_status).to eq(200)
        user.reload
        expect(json).to have_key "authToken"
        expect(json['authToken']).to eq user.auth_token
      end
    end

    context "User signin with an existing device" do
      parameter :device, "A key-value-paired array which describes the device, " \
                         "e.g. device = { system: 'ios', version: '6.0b', deviceId: 'xxx-xxxx-xxx' }", required: true
      parameter :deviceId, "A unique hardware ID from the current device (max. 128 chars) ",
                scope: :device, required: true

      let(:device) {{ device: attributes_for(:device) }}

      example "User signin with an existing device", document: :v1 do
        explanation "returns OK and an AuthToken if credentials match\n\n" \
                    "returns 401 if credentials invalid"
        do_request

        expect(response_status).to eq(200)
        user.reload
        expect(json).to have_key "authToken"
        expect(json['authToken']).to eq user.auth_token
      end
    end
  end

  post "/v1/users/reset", :vcr do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :email, "Email of the user for whom to reset password",
              required: true

    let(:user) do
      create(:user,
             email: 'success@simulator.amazonses.com',
             password: "nottimeslot")
    end
    let(:email) { user.email }

    example "Reset password", document: :v1 do
      explanation "Resets password and sends it to user via email\n\n" \
                  "returns OK if valid email\n\n" \
                  "returns 403 if invalid email"
      do_request

      expect(response_status).to eq(200)
    end
  end

  get "/v1/users/:id/media" do
    header 'Authorization', :auth_header

    let!(:target_user) { create(:user) }
    let!(:friend) { create(:user) }
    let!(:member) { create(:user) }
    let!(:slot_public) { create(:std_slot_public, :with_media,
                                owner: target_user, creator: target_user) }
    let!(:slot_private) { create(:std_slot_private, :with_media,
                                 owner: target_user, creator: target_user) }
    let!(:slot_friend) { create(:std_slot_friends, :with_media,
                                owner: friend, creator: friend) }
    let!(:slot_friend_public) { create(:std_slot_public, :with_media,
                                       owner: friend, creator: friend) }
    let!(:slot_friend_private) { create(:std_slot_private, :with_media,
                                        owner: friend, creator: friend) }
    let!(:slot_group) { create(:group_slot, :with_media, creator: member) }
    let!(:slot_group_public) { create(:std_slot_public, :with_media,
                                      owner: member, creator: member) }
    let!(:slot_group_private) { create(:std_slot_private, :with_media,
                                       owner: member, creator: member) }
    let!(:friendship) { create(:friendship, :established,
                               user: current_user, friend: friend) }
    let!(:memberships) {
      create(:membership, :active, group: slot_group.group, user: current_user)
      create(:membership, :active, group: slot_group.group, user: member)
    }
    let!(:id) { target_user[:id] }
    let!(:auth_header) { "Token token=#{current_user.auth_token}" }

    parameter :id, "ID of the User to get the MediaItems for", required: true
    response_field :array, "containing media items as a list of MediaItem"

    context "Get media items as a visitor" do
      let!(:visitor) { create(:user) }
      let!(:current_user) { visitor }
      let(:auth_header) { nil }

      example "As a visitor get all public media items of a specific user" do
        explanation "Returns an array which includes all public media items " \
                    "of the specific user."

        header 'Authorization', :auth_header

        do_request

        expect(response_status).to eq(200)
        expect(response_body).to include(slot_public.media_items[0].public_id)
        expect(response_body).not_to include(slot_private.media_items[0].public_id)
        expect(response_body).not_to include(slot_friend.media_items[0].public_id)
        expect(response_body).not_to include(slot_group.media_items[0].public_id)
        expect(json.length).to eq(6)
      end
    end

    context "Get all public media items of a specific user" do
      example "Get media items of an user", document: :v1 do
        explanation "Returns an array which includes all public media items of a specific user."

        do_request

        expect(response_status).to eq(200)
        expect(response_body).to include(slot_public.media_items[0].public_id)
        expect(response_body).not_to include(slot_private.media_items[0].public_id)
        expect(response_body).not_to include(slot_friend.media_items[0].public_id)
        expect(response_body).not_to include(slot_group.media_items[0].public_id)
        expect(json.length).to eq(6)
      end
    end

    context "Get all friend-visible media items of a user" do
      let(:id) { friend[:id] }

      example "Get all friend-visible media items of a user" do
        explanation "Returns an array which includes all media items of this user " \
                    "which are public or friend-visible."

        do_request

        expect(response_status).to eq(200)
        expect(response_body).to include(slot_friend.media_items[0].public_id)
        expect(response_body).to include(slot_friend_public.media_items[0].public_id)
        expect(response_body).not_to include(slot_friend_private.media_items[0].public_id)
        expect(response_body).not_to include(slot_group.media_items[0].public_id)
        expect(response_body).not_to include(slot_public.media_items[0].public_id)
        expect(response_body).not_to include(slot_private.media_items[0].public_id)
        expect(json.length).to eq(12)
      end
    end

    context "Get group-related media items of a specific user" do
      let(:id) { member[:id] }

      example "Get group-related media items of a specific user with a common group" do
        explanation "Returns an array which includes all media " \
                    "items of a specific user with a common group."

        do_request

        expect(response_status).to eq(200)
        expect(response_body).to include(slot_group.media_items[0].public_id)
        expect(response_body).to include(slot_group_public.media_items[0].public_id)
        expect(response_body).not_to include(slot_group_private.media_items[0].public_id)
        expect(response_body).not_to include(slot_friend.media_items[0].public_id)
        expect(response_body).not_to include(slot_public.media_items[0].public_id)
        expect(response_body).not_to include(slot_private.media_items[0].public_id)
        expect(json.length).to eq(12)
      end
    end
  end

  get "/v1/users/:id/slots" do
    header "Authorization", :auth_header

    parameter :id, "ID of the user to get the slots for."

    context 'pagination' do
      parameter :limit, "Maximum number of slots returned." \
                        " Default is 40. Maximum is 100."
      parameter :moment, "A point in time. Query parameter to get slots " \
                         "relative to a specific moment. Must be UTC.\n" \
                         "Default is Time.zone.now (server time)."
      parameter :filter, "Query parameter to filter slots relative to a " \
                         "given **moment**. Must be one of:\n" \
                         "- **past**: *start* before *moment*\n" \
                         "- **upcoming**: *start* after or equal *moment*\n" \
                         "- **ongoing**: *start* before & *end* after *moment*\n" \
                         "- **finished**: *start* & *end* before *moment*\n" \
                         "- **now**: *ongoing* & *upcoming* slots\n" \
                         "- **around**: tba\n" \
                         "- **all**: no restriction\n" \
                         "Default is **upcoming**."
      parameter :before, "Pagination cursor to retrieve slots which do happen" \
                         " BEFORE the slot " \
                         "represented by this cursor. If a cursor is " \
                         "send, **status** and **moment** are ignored."
      parameter :after, "Pagination cursor to retrieve slots which do happen" \
                        " AFTER the slot represented by this cursor. If a " \
                        "cursor is send, **filter** and **moment** are ignored."

      response_field :paging, "Hash containing relevant paging parameters."
      response_field :limit, "Maximum number of slots returned."
      response_field :filter, "Types of slots which were requested."
      response_field :moment, "Point-in-time which was used for the query."
      response_field :before, "Cursor that represents the first item in the " \
                              "response dataset."
      response_field :after, "Cursor that represents the last item in the " \
                             "response dataset."
      response_field :data, "Array containing the result dataset."

      describe "Get slots for current user - with pagination" do
        let(:id) { current_user.id }
        let(:filter) { 'upcoming' }
        let(:moment) { Time.zone.now.as_json }
        let(:limit) { 3 }

        let!(:std_slot_1) { create(:std_slot_private, owner: current_user,
                                   start_date: Time.zone.tomorrow.next_week) }
        let!(:std_slot_2) { create(:std_slot_friends, owner: current_user,
                                   start_date: Time.zone.today.next_week) }
        let!(:re_slots) { create_list(:re_slot, 2, slotter: current_user) }
        let!(:upcoming_slot) { create(:std_slot_private, owner: current_user,
                                      start_date: Time.zone.tomorrow) }

        example "Get slots for current user - with pagination", document: :v1 do
          explanation "Response contains a '*paging*' hash and a '*data*' array.\n" \
                      "If there are more than **limit** results, '*paging*' " \
                      "has **before** and **after** cursors which can be used" \
                      " for subsequent requests. The first request should " \
                      "always be made with **filter** '*upcoming*' to make " \
                      "sure no results are skipped." \
                      "'*data*' contains an array which includes " \
                      "StandardSlots & ReSlots\n\n" \
                      "If a user is authenticated the slot settings" \
                      " (alerts) will be included.\n\n" \
                      "The returned slots are ordered by startdate, enddate, id."

          do_request

          # first request without a cursor
          expect(response_status).to eq(200)
          slot_count = current_user.std_slots.count +
                       current_user.re_slots.count
          expect(json).to have_key 'paging'
          expect(json['paging']).to have_key('after')
          expect(json['paging']['after']).not_to be nil
          after_cursor = json['paging']['after']

          expect(json).to have_key 'data'
          response_slot_count = json['data'].length
          expect(json['data'].first).to have_key("id")
          expect(json['data'].first).to have_key("title")
          expect(json['data'].first).to have_key("location")
          expect(json['data'].first).to have_key("startDate")
          expect(json['data'].first).to have_key("endDate")
          expect(json['data'].first).to have_key("settings")
          expect(json['data'].first).to have_key("createdAt")
          expect(json['data'].first).to have_key("updatedAt")
          expect(json['data'].first).to have_key("deletedAt")
          expect(json['data'].first).to have_key("creator")
          expect(json['data'].first).to have_key("notes")
          expect(json['data'].first).to have_key("likes")
          expect(json['data'].first).to have_key("commentsCounter")
          expect(json['data'].first).to have_key("visibility")
          expect(json['data'].first).to have_key("media")
          expect(json['data'].first).to have_key("url")
          expect(response_body).to include(std_slot_1.title)
          expect(response_body).to include(std_slot_2.title)

          # make a subsequent request based on 'after' cursor
          client.get "/v1/users/#{current_user.id}/slots",
                     { after: after_cursor }, headers

          expect(response_status).to eq(200)
          json = JSON.parse(response_body)

          expect(json).to have_key 'paging'
          expect(json['paging']).to have_key('filter')
          expect(json['paging']).to have_key('after')
          expect(json['paging']).to have_key('limit')
          expect(json['paging']['filter']).to be nil
          expect(json['paging']['after']).to be nil
          expect(json['paging']['limit']).to eq 40
          expect(response_body).to include(re_slots.first.title)
          expect(response_body).to include(re_slots.last.title)

          expect(json).to have_key 'data'
          response_slot_count += json['data'].length
          expect(response_slot_count).to eq slot_count
        end
      end
    end

    context 'no pagination' do
      response_field :id, "ID of the slot"
      response_field :title, "Title of the slot"
      response_field :startDate, "Startdate of the slot"
      response_field :endDate, "Enddate of the slot"
      response_field :creatorId, "ID of the User who created the slot"
      response_field :alerts, "Alerts for the slot for the current user"
      response_field :notes, "A list of all notes on the slot"
      response_field :likes, "Number of likes for the slot"
      response_field :commentsCounter, "Number of comments on the slot"
      response_field :images, "Images for the slot"
      response_field :audios, "Audio recordings for the slot"
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
                      " (alerts) will be included.\n\n" \
                      "The returned slots are ordered by startdate, enddate, id."

          do_request

          expect(response_status).to eq(200)
          slot_count = current_user.std_slots.count +
                       current_user.re_slots.count
          expect(json.length).to eq slot_count
          expect(json.first).to have_key("id")
          expect(json.first).to have_key("title")
          expect(json.first).to have_key("location")
          expect(json.first).to have_key("startDate")
          expect(json.first).to have_key("endDate")
          expect(json.first).to have_key("settings")
          expect(json.first).to have_key("createdAt")
          expect(json.first).to have_key("updatedAt")
          expect(json.first).to have_key("deletedAt")
          expect(json.first).to have_key("creator")
          expect(json.first).to have_key("notes")
          expect(json.first).to have_key("likes")
          expect(json.first).to have_key("commentsCounter")
          expect(json.first).to have_key("visibility")
          expect(json.first).to have_key("media")
          expect(json.first).to have_key("url")
          expect(response_body).to include(std_slot_1.title)
          expect(response_body).to include(std_slot_2.title)
          expect(response_body).to include(re_slots.first.title)
        end
      end

      describe "Get slots for other user" do
        let(:joe) { create(:user, username: "Joe") }
        let(:id) { joe.id }

        let!(:std_slot_secret) { create(:std_slot_private, owner: joe) }
        let!(:std_slot_friend) { create(:std_slot_friends, owner: joe) }
        let!(:std_slot_foaf) { create(:std_slot_foaf, owner: joe) }
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
                        " visibility 'friend', 'foaf' (friend-of-friend) or" \
                        " 'public', ReSlots & shared GroupSlots\n\n" \
                        "If a user is authenticated the slot settings" \
                        " (alerts) will be included."
            do_request

            expect(response_status).to eq(200)
            slot_count = joe.std_slots_friends.count +
                         joe.std_slots_foaf.count +
                         joe.std_slots_public.count +
                         current_user.shared_group_slots(joe).count +
                         joe.re_slots.count
            expect(json.length).to eq slot_count
            expect(json.first).to have_key("id")
            expect(response_body).not_to include std_slot_secret.title
            expect(response_body).to include std_slot_friend.title
            expect(response_body).to include std_slot_foaf.title
            expect(response_body).to include std_slot_public.title
            expect(response_body).to include groupslot.title
            expect(response_body).not_to include incommon_groupslot.title
          end
        end

        describe "friend of befriended user" do
          let!(:friendship) do
            common_friend = create(:user)
            create(:friendship, :established, user: joe,
                   friend: common_friend)
            create(:friendship, :established, user: common_friend,
                   friend: current_user)
          end
          let(:groupslot) { create(:group_slot) }
          let!(:memberships) {
            create(:membership, :active, group: groupslot.group, user: current_user)
            create(:membership, :active, group: groupslot.group, user: joe)
            create(:membership, :active, group: incommon_groupslot.group, user: joe)
          }

          example "Get slots for befriended user", document: :v1 do
            explanation "Returns an array which includes StandardSlots with" \
                        " visibility 'foaf' (friend-of-friend) or 'public'," \
                        " ReSlots & shared GroupSlots\n\n" \
                        "If a user is authenticated the slot settings" \
                        " (alerts) will be included."
            do_request

            expect(response_status).to eq(200)
            slot_count = joe.std_slots_foaf.count +
                         joe.std_slots_public.count +
                         current_user.shared_group_slots(joe).count +
                         joe.re_slots.count
            expect(json.length).to eq slot_count
            expect(json.first).to have_key("id")
            expect(response_body).not_to include std_slot_secret.title
            expect(response_body).not_to include std_slot_friend.title
            expect(response_body).to include std_slot_foaf.title
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

      expect(response_status).to be 200
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
      explanation "Receives a list of User IDs for which a friendship " \
                  "with the current user will be refused or deleted.\n\n" \
                  "returns 404 if an User ID is invalid"

      do_request

      expect(response_status).to be 200
      current_user.reload
      expect(current_user.friends).not_to include john
      expect(current_user.requested_friends).not_to include bob
      expect(current_user.friends).not_to include mary
      expect(current_user.friends).not_to include alice
    end
  end
end
