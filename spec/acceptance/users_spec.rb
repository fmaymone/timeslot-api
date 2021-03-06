require 'documentation_helper'
require 'acceptance/shared_contexts'

resource "Users" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password, :with_device) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  post "/v1/users" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"

    parameter :username, "Username of user (3-50 characters)",
              required: true
    parameter :firstName, "First name of user (2-50 characters)",
              required: false
    parameter :middleName, "Middle name of user (2-50 characters)",
              required: false
    parameter :lastName, "Last name of user (2-50 characters)",
              required: false
    parameter :gender, "Gender of the user (male, female, other)",
              required: false
    parameter :email, "Email of user (max. 254 characters)"
    parameter :phone, "Phone number of user (max. 35 characters)"
    parameter :lang, "Language of user (2 characters, ISO 639-1)"
    parameter :password, "Password for user (min. 5 & max. 72 characters)",
              required: true

    include_context "current user response fields"
    response_field :authToken, "Authentication Token for the user to be set" \
                               " as a HTTP header in subsequent requests"
    let(:username) { "foo" }
    let(:firstName) { "Lana" }
    let(:middleName) { "Del" }
    let(:lastName) { "Rey" }
    let(:email) { "someone@timeslot.com" }
    let(:password) { "secret-thing" }
    let(:lang) { "de" }
    let(:gender) { "female" }

    example "Signup - Create user", document: :v1 do
      explanation "Either an email or phone number must be provided\n\n" \
                  "returns 422 if parameters are missing\n\n" \
                  "returns 422 if parameters are invalid"
      do_request

      expect(response_status).to eq(201)
      expect(json).to have_key 'id'
      expect(json).to have_key 'username'
      expect(json['username']).to eq 'foo'
      expect(json).to have_key 'firstName'
      expect(json['firstName']).to eq 'Lana'
      expect(json).to have_key 'middleName'
      expect(json['middleName']).to eq 'Del'
      expect(json).to have_key 'lastName'
      expect(json['lastName']).to eq 'Rey'
      expect(json).to have_key 'email'
      expect(json['email']).to eq 'someone@timeslot.com'
      expect(json).to have_key 'lang'
      expect(json['lang']).to eq 'de'
      expect(json).to have_key 'gender'
      expect(json['gender']).to eq 'female'
      expect(json).to have_key 'authToken'
      expect(json['authToken']).not_to be nil
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

      example "Signup - Create user with a specific device",
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

  post "/v1/users/public" do
    header "Content-Type", "application/json"
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :username, "Username of user (max. 50 characters)",
              required: false
    parameter :email, "Email of user (max. 254 characters)"
    parameter :phone, "Phone number of user (max. 35 characters)"
    parameter :lang, "Language of user (2 characters, ISO 639-1)"
    parameter :password, "Password for user (min. 5 & max. 72 characters)",
              required: false

    include_context "current user response fields"
    response_field :authToken, "Authentication Token for the user to be set" \
                               " as a HTTP header in subsequent requests"
    let(:username) { "foo" }
    let(:email) { "someone@timeslot.com" }
    let(:password) { "secret-thing" }
    let(:lang) { "de" }

    context "Signup and creates a public user profile" do
      parameter :role,
                "Must be define the users role: 'public_user'",
                required: true

      let(:role) { 'public_user' }

      example "Signup - Creates a public user profile",
              document: :v1 do
        explanation "Either an email or phone number must be provided\n\n" \
                    "returns 401 if user is not logged in\n\n" \
                    "returns 403 if user account has no email\n\n" \
                    "returns 422 if parameters are missing\n\n" \
                    "returns 422 if parameters are invalid"
        do_request

        expect(response_status).to eq(201)
        expect(json).to have_key 'id'
        expect(json).to have_key 'username'
        expect(json).to have_key 'email'
        expect(json).to have_key 'authToken'
        expect(json).to have_key 'push'
        expect(json['email']).not_to eq('someone@timeslot.com')
        expect(json['email']).to eq(current_user.email)

        expect(User.last.reload.public_user?).to be(true)
      end

      context "Validates creation of a public user profile" do
        let(:auth_header) { nil }

        example "Signup - Doesn't creates a public user profile if user is not logged in",
                document: false do
          explanation "Either an email or phone number must be provided\n\n" \
                      "returns 401 if user is not logged in\n\n" \
                      "returns 403 if user account has no email\n\n" \
                      "returns 422 if parameters are missing\n\n" \
                      "returns 422 if parameters are invalid"
          do_request

          expect(response_status).to eq(401)
        end
      end

      context "Validates creation of a public user profile" do
        let!(:current_user) { create(:user, :with_password, email: nil) }

        example "Signup - Doesn't creates a public user profile if user has no email",
                document: false do
          explanation "Either an email or phone number must be provided\n\n" \
                      "returns 401 if user is not logged in\n\n" \
                      "returns 403 if user account has no email\n\n" \
                      "returns 422 if parameters are missing\n\n" \
                      "returns 422 if parameters are invalid"
          do_request

          expect(response_status).to eq(403)
        end
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

    example "Signin", document: :v1 do
      explanation "returns OK and an AuthToken if credentials match\n\n" \
                  "returns 401 if credentials invalid"
      do_request

      expect(response_status).to eq(200)
      user.reload
      expect(json).to have_key "authToken"
      expect(json['authToken']).to eq user.auth_token
    end

    context "Signin with new device" do
      parameter :device,
                "A key-value-paired array which describes the device," \
                " e.g. device = { system: 'ios', version: '6.0b'," \
                " deviceId: 'xxx-xxxx-xxx' }",
                required: true
      parameter :system,
                "A string shorthand of the current device operating" \
                " system (max. 10 chars), e.g.: 'ios', 'android' ",
                scope: :device,
                required: true
      parameter :version,
                "A string for the version of the current device operating" \
                " system (max. 10 chars), e.g.: '6.0b' ",
                scope: :device,
                required: true
      parameter :deviceId,
                "A unique hardware ID from the current device (max. 128 chars)",
                scope: :device,
                required: true

      let(:device) { { device: attributes_for(:device) }}

      example "Signin with new device", document: :v1 do
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
      parameter :device,
                "A key-value-paired array which describes the device, " \
                "e.g. device = { system: 'ios', version: '6.0b'," \
                " deviceId: 'xxx-xxxx-xxx' }", required: true
      parameter :deviceId,
                "A unique hardware ID from the current device (max. 128 chars)",
                scope: :device,
                required: true

      let(:device) { { device: attributes_for(:device) } }

      example "Signin with existing device", document: :v1 do
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

  get "/v1/users/:id" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :id, "ID of the user to get", required: true

    context "other user" do
      include_context "default user response fields"

      let(:user) { create(:user, :with_location) }
      let(:id) { user.id }

      example "Get basic data for User", document: :v1 do
        explanation "returns 404 if ID is invalid\n\n"
        do_request

        expect(response_status).to eq(200)
        # basic user response fields
        expect(json).to have_key "id"
        expect(json).to have_key "username"
        expect(json).to have_key "createdAt"
        expect(json).to have_key "updatedAt"
        expect(json).to have_key "deletedAt"
        expect(json).to have_key "image"
        # default user response fields
        expect(json).to have_key "location"
        expect(json).to have_key "slotCount"
        # expect(json).to have_key "reslotCount"
        expect(json).to have_key "friendsCount"

        expect(json).to have_key "friendshipState"
        # excluded attributes
        expect(json).not_to have_key "lang"
        expect(json).not_to have_key "email"
        expect(json).not_to have_key "emailVerified"
        expect(json).not_to have_key "phone"
        expect(json).not_to have_key "phoneVerified"
        expect(json).not_to have_key "publicUrl"
        expect(json).not_to have_key "push"
        # defaults
        # expect(json).to have_key "slotDefaultDuration"
        # expect(json).to have_key "slotDefaultLocationId"
        # expect(json).to have_key "slotDefaultTypeId"
        # expect(json).to have_key "defaultPrivateAlerts"
        # expect(json).to have_key "defaultOwnFriendslotAlerts"
        # expect(json).to have_key "defaultOwnPublicAlerts"
        # expect(json).to have_key "defaultFriendsFriendslotAlerts"
        # expect(json).to have_key "defaultFriendsPublicAlerts"
        # expect(json).to have_key "defaultReslotAlerts"
        # expect(json).to have_key "defaultGroupAlerts"
        # special slotsets
        expect(json).not_to have_key "myCalendarUuid"
        expect(json).not_to have_key "friendsCalendarUuid"
        expect(json).not_to have_key "allMySlotsUuid"
        expect(json).not_to have_key "myCreatedSlotsUuid"
        expect(json).not_to have_key "myFriendSlotsUuid"
        expect(json).not_to have_key "myPublicSlotsUuid"
        # social relations
        expect(json).not_to have_key "friendships"
        expect(json).not_to have_key "memberships"

        expect(json).not_to have_key "authToken"
        expect(json).not_to have_key "passwordDigest"
        expect(json).not_to have_key "role"
        expect(json).not_to have_key "deviceToken"
        expect(json).not_to have_key "picture"

        expect(json['id']).to eq user.id
        expect(json['username']).to eq user.username
        expect(json['createdAt']).to eq user.created_at.as_json
        expect(json['updatedAt']).to eq user.updated_at.as_json
        expect(json['deletedAt']).to eq user.deleted_at.as_json
        expect(json['image']).to eq user.image
        expect(json['location']['name']).to eq user.location.name
        expect(json['slotCount']).to eq user.std_slots.active.count
        # expect(json['reslotCount']).to eq user.re_slots.active.count
        expect(json['friendsCount']).to eq user.friends_count
        expect(json['friendshipState']).to eq 'stranger'
      end
    end
  end

  get "/v1/users/:id/media" do
    header 'Authorization', :auth_header

    parameter :id, "ID of the User to get the MediaItems for", required: true
    response_field :array, "containing media items as a list of MediaItem"

    let(:user) { create(:user) }
    let(:id) { user.id }

    let!(:slot_public) {
      create(:std_slot_public, :with_media, creator: user) }
    let!(:slot_foaf) {
      create(:std_slot_foaf, :with_media, creator: user) }
    let!(:slot_friend) {
      create(:std_slot_friends, :with_media, creator: user) }
    let!(:slot_private) {
      create(:std_slot_private, :with_media, creator: user) }
    # let!(:shared_group) do
    #   gs = create(:group_slot, :with_media, creator: user)
    #   create(:membership, :active, group: gs.group, user: current_user)
    #   create(:membership, :active, group: gs.group, user: user)
    #   gs
    # end
    # let!(:unshared_group) do
    #   gs = create(:group_slot, :with_media, creator: user)
    #   create(:membership, :active, group: gs.group, user: user)
    #   gs
    # end

    context "friend" do
      let!(:friendship) {
        create(:friendship, :established, user: current_user, friend: user)
      }

      example "Get media items for Friend", document: :v1 do
        explanation "Returns an array which includes all media items of" \
                    " the friend which are public-, friend- or foaf-visible" \
                    " and if users have shared groups also the media items" \
                    " which the friend has added to this group."
        do_request

        expect(response_status).to eq(200)
        expect(response_body).to include(slot_public.media_items[0].public_id)
        expect(response_body).to include(slot_foaf.media_items[0].public_id)
        expect(response_body).to include(slot_friend.media_items[0].public_id)
        # expect(response_body).to include(shared_group.media_items[0].public_id)
        expect(
          response_body
        ).not_to include(slot_private.media_items[0].public_id)
        # expect(
        #   response_body
        # ).not_to include(unshared_group.media_items[0].public_id)
        # expect(json.length).to eq(24)
        expect(json.length).to eq(18)
      end
    end

    context "foaf" do
      let!(:friendship) {
        friend = create(:user)
        create(:friendship, :established, user: current_user, friend: friend)
        create(:friendship, :established, user: friend, friend: user)
      }

      example "Get media items for Friend-of-Friend", document: :v1 do
        explanation "Returns an array which includes all media items of" \
                    " the friend which are public- or foaf-visible" \
                    " and if users have shared groups also the media items" \
                    " which the friend has added to this group."
        do_request

        expect(response_status).to eq(200)
        expect(response_body).to include(slot_public.media_items[0].public_id)
        expect(response_body).to include(slot_foaf.media_items[0].public_id)
        # expect(response_body).to include(shared_group.media_items[0].public_id)
        expect(
          response_body
        ).not_to include(slot_private.media_items[0].public_id)
        expect(
          response_body
        ).not_to include(slot_friend.media_items[0].public_id)
        # expect(
        #   response_body
        # ).not_to include(unshared_group.media_items[0].public_id)
        # expect(json.length).to eq(18)
        expect(json.length).to eq(12)
      end
    end

    context "stranger" do
      example "Get media items for Stranger", document: :v1 do
        explanation "Returns an array which includes all public media items" \
                    " of a specific user and media items this user has added" \
                    " to common groups."
        do_request

        expect(response_status).to eq(200)
        expect(response_body).to include(slot_public.media_items[0].public_id)
        # expect(response_body).to include(shared_group.media_items[0].public_id)
        expect(
          response_body
        ).not_to include(slot_private.media_items[0].public_id)
        expect(
          response_body
        ).not_to include(slot_friend.media_items[0].public_id)
        # expect(
        #   response_body
        # ).not_to include(unshared_group.media_items[0].public_id)
        # expect(json.length).to eq(12)
        expect(json.length).to eq(6)
      end
    end

    context "visitor" do
      let(:auth_header) { nil }

      example "Get media items as Visitor",
              document: :v1 do
        explanation "Visitor means there is no current user.\n\n" \
                    "Returns an array which includes all public media items " \
                    "of the specific user."

        header 'Authorization', :auth_header

        do_request

        expect(response_status).to eq(200)
        expect(response_body).to include(slot_public.media_items[0].public_id)
        expect(
          response_body
        ).not_to include(slot_private.media_items[0].public_id)
        expect(
          response_body
        ).not_to include(slot_friend.media_items[0].public_id)
        # expect(
        #   response_body
        # ).not_to include(unshared_group.media_items[0].public_id)
        # expect(
        #   response_body
        # ).not_to include(shared_group.media_items[0].public_id)
        expect(json.length).to eq(6)
      end
    end
  end

  get "/v1/users/:id/slots" do
    header "Authorization", :auth_header

    parameter :id, "ID of the user to get the slots for."

    context 'pagination' do
      include_context "slot pagination"

      let(:friend) do
        friend = create(:user)
        create(:friendship, :established, user: current_user, friend: friend)
        friend
      end
      let(:id) { friend.id }

      describe "Get slots for friend - with 'between' pagination" do
        let(:filter) { 'between' }
        let(:limit) { 2 }
        let(:earliest) { '2016-04-21T09:06:18.000Z' }
        let(:latest) { '2016-04-21T19:06:18.000Z' }

        let!(:slots) do
          [create(:std_slot_public, creator: friend, title: 'in between',
                  start_date: '2016-04-21 15:06:18Z',
                  end_date: '2016-04-21 16:06:18Z'
                 ),
           create(:std_slot_public, creator: friend, title: 'overlap earliest',
                  start_date: '2016-04-21 03:06:18Z',
                  end_date: '2016-04-21 16:06:18Z'
                 ),
           create(:std_slot_public, creator: friend, title: 'overlap latest',
                  start_date: '2016-04-21 15:06:18Z',
                  end_date: '2016-04-21 23:06:18Z'
                 ),
           create(:std_slot_public, creator: friend, title: 'overlap both',
                  start_date: '2016-04-21 05:06:18Z',
                  end_date: '2016-04-21 22:06:18Z'
                 ),
           create(:std_slot_public, creator: friend, title: 'starts near end',
                  start_date: '2016-04-21 19:06:17Z',
                  end_date: '2016-04-21 22:06:18Z'
                 )
          ]
        end
        let!(:before_slot) do
          create(:std_slot_public, creator: friend, title: 'before',
                 start_date: '2016-04-21 01:06:18Z',
                 end_date: '2016-04-21 03:06:18Z'
                )
        end
        let!(:problematic_before_slot) do
          create(:std_slot_public, creator: friend, title: 'problematic before',
                 start_date: '2016-04-21 06:06:18Z',
                 end_date: '2016-04-21 07:06:18Z'
                )
        end
        let!(:later_slot) do
          create(:std_slot_public, creator: friend, title: 'later',
                 start_date: '2016-04-21 22:06:18Z',
                 end_date: '2016-04-21 23:06:18Z'
                )
        end

        example "Get slots for Friend - with 'between' pagination",
                document: :v1 do
          do_request

          # first request without a cursor
          expect(response_status).to eq(200)

          expect(json).to have_key 'paging'
          expect(json['paging']).to have_key('mode')
          expect(json['paging']['mode']).to eq 'now'
          expect(json['paging']).to have_key('filter')
          expect(json['paging']['filter']).to eq 'between'
          expect(json['paging']).to have_key('earliest')
          expect(json['paging']).to have_key('latest')
          expect(json['paging']).to have_key('before')
          expect(json['paging']['before']).to be nil
          expect(json['paging']).to have_key('after')
          expect(json['paging']['after']).not_to be nil
          after_cursor = json['paging']['after']
          expect(json).to have_key 'data'
          expect(json['data'].first).to have_key("id")

          returned_slots = json['data']

          returned_slots.each do |slot|
            expect(slot['endDate']).to be > earliest.as_json
            expect(slot['startDate']).to be < latest.as_json
          end

          # make a subsequent request based on 'after' cursor
          client.get "/v1/users/#{friend.id}/slots",
                     { after: after_cursor, filter: filter, limit: limit,
                       earliest: earliest, latest: latest }, headers

          expect(response_status).to eq(200)

          json = JSON.parse(response_body)
          expect(json).to have_key 'paging'
          expect(json['paging']).to have_key('mode')
          expect(json['paging']['mode']).to eq 'now'
          expect(json['paging']).to have_key('before')
          expect(json['paging']['before']).not_to be nil
          expect(json['paging']).to have_key('after')
          expect(json['paging']['after']).not_to be nil
          expect(json['paging']).to have_key('limit')
          expect(json['paging']['limit']).to eq limit
          expect(json['paging']).to have_key('filter')
          expect(json['paging']['filter']).to eq 'between'

          # expect(json['paging']['limit']).to eq PAGINATION_MAX_LIMIT

          after_cursor = json['paging']['after']

          expect(json).to have_key 'data'

          second_slots = json['data']
          second_slots.each do |slot|
            expect(slot['endDate']).to be > earliest.as_json
            expect(slot['startDate']).to be < latest.as_json
          end

          returned_slots << second_slots

          # make a subsequent request based on 'after' cursor
          client.get "/v1/users/#{friend.id}/slots",
                     { after: after_cursor, filter: filter, limit: limit,
                       earliest: earliest, latest: latest }, headers

          expect(response_status).to eq(200)

          json = JSON.parse(response_body)
          expect(json).to have_key 'paging'
          expect(json['paging']).to have_key('mode')
          expect(json['paging']).to have_key('before')
          expect(json['paging']['before']).not_to be nil
          expect(json['paging']).to have_key('after')
          expect(json['paging']['after']).to be nil
          expect(json['paging']).to have_key('limit')
          expect(json['paging']).to have_key('filter')
          expect(json['paging']['filter']).to eq 'between'

          third_slots = json['data']
          third_slots.each do |slot|
            expect(slot['endDate']).to be > earliest.as_json
            expect(slot['startDate']).to be < latest.as_json
          end

          returned_slots << third_slots

          expect(returned_slots.to_s).to include slots.first.title
          expect(returned_slots.to_s).to include slots.second.title
          expect(returned_slots.to_s).to include slots.third.title
          expect(returned_slots.to_s).to include slots.last.title
          expect(returned_slots.to_s).not_to include before_slot.title
          expect(returned_slots.to_s).not_to include later_slot.title
          expect(returned_slots.to_s).not_to include problematic_before_slot.title
        end
      end

      describe "Get slots for Friend - with 'upcoming' pagination" do
        let(:mode) { 'upcoming' }
        let(:moment) { Time.zone.now.as_json }
        let(:limit) { 3 }

        let!(:std_slot_private) {
          create(:std_slot_private, creator: friend,
                 start_date: Time.zone.tomorrow.next_week) }
        let!(:std_slot_friend) {
          create(:std_slot_friends, creator: friend,
                 start_date: Time.zone.today.next_week) }
        let!(:std_slot_foaf) {
          create(:std_slot_friends, creator: friend,
                 start_date: Time.zone.today.next_week) }
        let!(:std_slot_public) {
          create(:std_slot_public, creator: friend,
                 start_date: Time.zone.tomorrow) }
        # let!(:re_slots) { create_list(:re_slot, 2, slotter: friend) }

        example "Get slots for Friend - with 'upcoming' pagination",
                document: :v1 do
          explanation "Response contains '*paging*' hash & '*data*' array.\n" \
                      "If there are more than **limit** results, '*paging*' " \
                      "has **before** and **after** cursors which can be used" \
                      " for subsequent requests. The first request should " \
                      "always be made with **mode** '*upcoming*' to make " \
                      "sure no results are skipped." \
                      "'*data*' contains an array which includes " \
                      "StandardSlots.\n\n" \
                      "If a user is authenticated the slot settings" \
                      " (alerts) will be included.\n\n" \
                      "The returned slots are ordered by startdate, enddate, id."

          do_request

          # first request without a cursor
          expect(response_status).to eq(200)
          slot_count = friend.std_slots.count -
                       friend.std_slots_private.count
                      # friend.re_slots.count
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
          expect(response_body).to include(std_slot_public.title)
          expect(response_body).to include(std_slot_friend.title)
          expect(response_body).to include(std_slot_foaf.title)
          expect(response_body).not_to include(std_slot_private.title)

          # make a subsequent request based on 'after' cursor
          client.get "/v1/users/#{friend.id}/slots",
                     { after: after_cursor }, headers

          expect(response_status).to eq(200)
          json = JSON.parse(response_body)

          expect(json).to have_key 'paging'
          expect(json['paging']).to have_key('mode')
          expect(json['paging']).to have_key('after')
          expect(json['paging']).to have_key('limit')
          expect(json['paging']['mode']).to be nil
          expect(json['paging']['after']).to be nil
          expect(json['paging']['limit']).to be <= PAGINATION_MAX_LIMIT
          expect(json['paging']['limit']).to eq PAGINATION_DEFAULT_LIMIT
          # expect(response_body).to include(re_slots.first.title)
          # expect(response_body).to include(re_slots.last.title)

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

      describe "Get slots for other user" do
        let(:joe) { create(:user, username: "Joe") }
        let(:id) { joe.id }

        let!(:std_slot_secret) { create(:std_slot_private, creator: joe) }
        let!(:std_slot_friend) { create(:std_slot_friends, creator: joe) }
        let!(:std_slot_foaf) { create(:std_slot_foaf, creator: joe) }
        let!(:std_slot_public) { create(:std_slot_public, creator: joe) }
        # let!(:re_slots) { create(:re_slot, slotter: joe) }
        # let(:incommon_groupslot) { create(:group_slot) }

        describe "befriended user" do
          let!(:friendship) {
            create(:friendship, :established, user: joe, friend: current_user) }
          # let(:groupslot) { create(:group_slot) }
          # let!(:memberships) {
          #   create(:membership, :active, group: groupslot.group,
          #          user: current_user)
          #   create(:membership, :active, group: groupslot.group, user: joe)
          #   create(:membership, :active, group: incommon_groupslot.group,
          #          user: joe)
          # }

          example "Get slots for Friend", document: :v1 do
            # TODO: wording
            explanation "Returns an array which includes StandardSlots with" \
                        " visibility 'friend', 'foaf' (friend-of-friend) or" \
                        " 'public', ReSlots & shared GroupSlots\n\n" \
                        "If a user is authenticated the slot settings" \
                        " (alerts) will be included."
            do_request

            expect(response_status).to eq(200)
            slot_count = joe.std_slots_friends.count +
                         joe.std_slots_foaf.count +
                         joe.std_slots_public.count
                         # current_user.shared_group_slots(joe).count +
                         # joe.re_slots.count
            expect(json.length).to eq slot_count
            expect(json.first).to have_key("id")
            expect(response_body).not_to include std_slot_secret.title
            expect(response_body).to include std_slot_friend.title
            expect(response_body).to include std_slot_foaf.title
            expect(response_body).to include std_slot_public.title
            # expect(response_body).to include groupslot.title
            # expect(response_body).not_to include incommon_groupslot.title
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
          # let(:groupslot) { create(:group_slot) }
          # let!(:memberships) {
          #   create(:membership, :active, group: groupslot.group,
          #          user: current_user)
          #   create(:membership, :active, group: groupslot.group, user: joe)
          #   create(:membership, :active, group: incommon_groupslot.group,
          #          user: joe)
          # }

          example "Get slots for Friend-of-Friend", document: :v1 do
            explanation "Returns an array which includes StandardSlots with" \
                        " visibility 'foaf' (friend-of-friend) or 'public'," \
                        " ReSlots & shared GroupSlots\n\n" \
                        "If a user is authenticated the slot settings" \
                        " (alerts) will be included."
            do_request

            expect(response_status).to eq(200)
            slot_count = joe.std_slots_foaf.count +
                         joe.std_slots_public.count
                         # joe.re_slots.count
            # current_user.shared_group_slots(joe).count +
            expect(json.length).to eq slot_count
            expect(json.first).to have_key("id")
            expect(response_body).not_to include std_slot_secret.title
            expect(response_body).not_to include std_slot_friend.title
            expect(response_body).to include std_slot_foaf.title
            expect(response_body).to include std_slot_public.title
            # expect(response_body).to include groupslot.title
            # expect(response_body).not_to include incommon_groupslot.title
          end
        end

        describe "unrelated user with common groups" do
          # let(:groupslot) { create(:group_slot) }
          # let!(:memberships) {
          #   create(:membership, :active, group: groupslot.group,
          #          user: current_user)
          #   create(:membership, :active, group: groupslot.group, user: joe)
          #   create(:membership, :active, group: incommon_groupslot.group,
          #          user: joe)
          # }

          example "Get slots for Stranger with common groups",
                  document: :v1 do
            explanation "Returns an array which includes StandardSlots with" \
                        " visibility 'public', 'public'-ReSlots & shared" \
                        " GroupSlots\n\n" \
                        "If a user is authenticated the slot settings" \
                        " (alerts) will be included."
            do_request

            expect(response_status).to eq(200)
            slot_count = joe.std_slots_public.count
                         # joe.re_slots.count
                         # current_user.shared_group_slots(joe).count
            expect(json.length).to eq slot_count
            expect(json.first).to have_key("id")
            expect(response_body).not_to include std_slot_secret.title
            expect(response_body).not_to include std_slot_friend.title
            expect(response_body).to include std_slot_public.title
            # expect(response_body).to include groupslot.title
            # expect(response_body).not_to include incommon_groupslot.title
          end
        end

        describe "unrelated user" do
          example "Get slots for Stranger", document: :v1 do
            explanation "Returns an array which includes StandardSlots with" \
                        " visibility 'public' and 'public'-ReSlots\n\n" \
                        "If a user is authenticated the slot settings" \
                        " (alerts) will be included."
            do_request

            expect(response_status).to eq(200)
            slot_count = joe.std_slots_public.count # + joe.re_slots.count
            expect(json.length).to eq slot_count
            expect(response_body).not_to include std_slot_secret.title
            expect(response_body).not_to include std_slot_friend.title
            expect(response_body).to include std_slot_public.title
            # expect(response_body).not_to include incommon_groupslot.title
          end
        end
      end
    end
  end

  get "/v1/users/:id/dates" do
    header "Authorization", :auth_header
    header "Accept", "application/json"

    parameter :id, "ID of the user to get the slot dates for."

    let(:user) { create(:user) }

    let!(:private_slot) {
      create(:std_slot_private, creator: user, start_date: '2015-01-01',
             end_date: '2015-01-02')
    }
    let!(:public_slot) {
      create(:std_slot_public, creator: user, start_date: '2016-02-02',
             end_date: '2016-02-04')

    }
    let!(:public_calendar_slot) do
      slot = create(:std_slot_public, start_date: '2017-03-03',
                    end_date: '2017-03-03')
      create(:passengership, user: user, slot: slot)
      slot
    end
    let(:id) { user.id }

    example "Get list of dates when slots of another user are happening",
            document: :v1 do
      explanation "Returns all dates where a slot returned by " \
                  "GET /users/:id/slots is happening.\n\n" \
                  "returns 404 if user doesn't exist"
      do_request

      expect(response_status).to eq(200)

      expect(response_body).to include public_slot.start_date.to_date.as_json
      expect(response_body).to include public_slot.end_date.to_date.as_json
      expect(response_body).to include public_calendar_slot.start_date.to_date.as_json
      expect(response_body).to include public_calendar_slot.end_date.to_date.as_json
      expect(response_body).not_to include private_slot.start_date.to_date.as_json
      expect(response_body).not_to include private_slot.end_date.to_date.as_json
    end
  end

  get "/v1/users/:id/friends" do
    header "Authorization", :auth_header
    header "Accept", "application/json"

    parameter :id, "ID of the user to get the friends for."

    let(:user) do
      user = create(:user, :with_3_friends)
      create(:friendship, :established, user: user, friend: current_user)
      user
    end
    let(:id) { user.id }

    example "Get list of friends of another user", document: :v1 do
      explanation "Other user must be friend with current user.\n\n" \
                  "returns list of friends of other user\n\n" \
                  "returns 404 if current user not friend with other user"
      do_request

      expect(response_status).to eq(200)
      expect(response_body).to include user.friends.first.username
      expect(response_body).to include user.friends.last.username
    end
  end

  get "/v1/users/:id/calendars" do
    header "Authorization", :auth_header
    header "Accept", "application/json"

    parameter :id, "ID of the user to get the calendars for."
    let(:user_with_calendars) do
      requestee = create(:user)
      create_list(:group, 3, public: false, owner: requestee)
      requestee
    end
    let(:public_group) { create(:group, :with_3_slots, public: true) }
    let!(:public_calendars) do
      calendars = create_list(:group, 2, public: true, owner: user_with_calendars)
      create(:membership, :active, group: public_group, user: user_with_calendars)
      calendars + [public_group]
    end
    let!(:shared_nonpublic_calendar) do
      shared_group = create(:group, public: false)
      create(:membership, :active, user: current_user,
             group: shared_group)
      create(:membership, :active, user: user_with_calendars,
             group: shared_group)
      shared_group
    end

    let(:id) { user_with_calendars.id }

    example "Get list of calendars of another user", document: :v1 do
      explanation "Includes all public calendars of this user and " \
                  "non-public calendars where user and current user " \
                  "are members.\n\n" \
                  "returns array of calendars with up to 4 preview slots per" \
                  " calendar\n\n" \
                  "returns 404 if current user not friend with other user"
      do_request

      expect(response_status).to eq(200)
      expect(response_body).to include public_calendars.first.name
      expect(response_body).to include public_calendars.second.name
      expect(response_body).to include public_calendars.third.name
      expect(response_body).to include shared_nonpublic_calendar.name
      expect(response_body).
        not_to include user_with_calendars.groups.non_public.first.name
      expect(json).to have_key('result')
      expect(json['result'].first).to have_key('previewSlots')
      expect(json['result'].length).to eq 4
      expect(response_body).to include public_group.slots.first.title
    end

    describe "preview slots" do
      let(:user_with_calendar) do
        requestee = create(:user)
        create(:group, :with_3_slots, public: true, owner: requestee)
        requestee
      end

      let(:id) { user_with_calendar.id }

      example "Get calendar with preview slots", document: :false do
        do_request
        expect(json['result'].first['previewSlots'].first).to have_key('media')
      end
    end
  end

  post "/v1/users/reset", :vcr, :aws do
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
end
