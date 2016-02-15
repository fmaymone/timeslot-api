require 'documentation_helper'
require 'acceptance/shared_contexts'

resource "Me" do
  let(:json) { JSON.parse(response_body) }
  let(:current_user) { create(:user, :with_email, :with_password, :with_device) }
  let(:auth_header) { "Token token=#{current_user.auth_token}" }

  get "/v1/me" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    include_context "current user response fields"

    let(:current_user) do
      user = create(:user, :with_email, :with_password, :with_location,
                    :with_private_slot, :with_public_slot,
                    :with_device, :with_phone, :with_3_friends, :with_3_groups)
      user.update(public_url: 'www.foo.bar', picture: 'www.looking.good')
      user
    end

    example "Get complete User data", document: :v1 do
      explanation "shows all User data."
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
      # current user response fields
      expect(json).to have_key "lang"
      expect(json).to have_key "email"
      expect(json).to have_key "emailVerified"
      expect(json).to have_key "phone"
      expect(json).to have_key "phoneVerified"
      expect(json).to have_key "publicUrl"
      expect(json).to have_key "push"
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
      expect(json).to have_key "myCalendarUuid"
      expect(json).to have_key "friendsCalendarUuid"
      expect(json).to have_key "allMySlotsUuid"
      expect(json).to have_key "myCreatedSlotsUuid"
      expect(json).to have_key "myFriendSlotsUuid"
      expect(json).to have_key "myPublicSlotsUuid"
      # social relations
      expect(json).to have_key "friendships"
      expect(json).to have_key "memberships"
      # excluded attributes
      expect(json).not_to have_key "authToken"
      expect(json).not_to have_key "passwordDigest"
      expect(json).not_to have_key "role"
      expect(json).not_to have_key "deviceToken"
      expect(json).not_to have_key "picture"

      current_user.reload

      expect(json['id']).to eq current_user.id
      expect(json['username']).to eq current_user.username
      expect(json['createdAt']).to eq current_user.created_at.as_json
      expect(json['updatedAt']).to eq current_user.updated_at.as_json
      expect(json['deletedAt']).to eq current_user.deleted_at.as_json
      expect(json['image']).to eq current_user.image
      expect(json['location']['name']).to eq current_user.location.name
      expect(json['slotCount']).to eq current_user.std_slots.active.count
      # expect(json['reslotCount']).to eq current_user.re_slots.active.count
      expect(json['friendsCount']).to eq current_user.friends_count

      expect(json['lang']).to eq current_user.lang
      expect(json['email']).to eq current_user.email
      expect(json['emailVerified']).to eq current_user.email_verified
      expect(json['phone']).to eq current_user.phone
      expect(json['phoneVerified']).to eq current_user.phone_verified
      expect(json['publicUrl']).to eq current_user.public_url
      expect(json['push']).to eq current_user.push

      expect(json['myCalendarUuid']).to eq current_user.my_cal_uuid
      expect(json['friendsCalendarUuid']).to eq current_user.friends_cal_uuid
      expect(json['allMySlotsUuid']).to eq current_user.my_lib_uuid
      expect(json['myCreatedSlotsUuid']).to eq current_user.my_created_slots_uuid
      expect(json['myFriendSlotsUuid']).to eq current_user.my_friend_slots_uuid
      expect(json['myPublicSlotsUuid']).to eq current_user.my_public_slots_uuid

      expect(json['friendships'].size).to eq current_user.friendships.count
      expect(json['memberships'].size).to eq current_user.memberships.count
    end
  end

  get "/v1/me/calendar" do
    header "Authorization", :auth_header
    let(:slot_1) { create(:std_slot_private) }
    let(:slot_2) { create(:std_slot_public) }

    let!(:my_calendar_slots) do
      create(:passengership, slot: slot_1, user: current_user)
      create(:passengership, slot: slot_2, user: current_user)
    end

    example "Get my Calendar slots", document: :v1 do
      explanation "Returns array with all slots in users 'MyCalendar'."

      do_request

      expect(response_status).to eq(200)
      expect(response_body).to include slot_1.title
      expect(response_body).to include slot_2.title
    end
  end

  get "/v1/me/slots" do
    header "Authorization", :auth_header

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
        let(:filter) { 'upcoming' }
        let(:moment) { Time.zone.now.as_json }
        let(:limit) { 3 }

        let!(:std_slot_1) { create(:std_slot_private, owner: current_user,
                                   start_date: Time.zone.tomorrow.next_week) }
        let!(:std_slot_2) { create(:std_slot_friends, owner: current_user,
                                   start_date: Time.zone.today.next_week) }
        # let!(:re_slots) { create_list(:re_slot, 2, slotter: current_user) }
        let!(:upcoming_slot) { create(:std_slot_private, owner: current_user,
                                      start_date: Time.zone.tomorrow) }

        example "Get slots - with pagination", document: :v1 do
          explanation "Response contains '*paging*' hash & '*data*' array.\n" \
                      "If there are more than **limit** results, '*paging*' " \
                      "has **before** and **after** cursors which can be used" \
                      " for subsequent requests. The first request should " \
                      "always be made with **filter** '*upcoming*' to make " \
                      "sure no results are skipped." \
                      "'*data*' contains an array which includes " \
                      "StandardSlots & ReSlots the current_user has made" \
                      " including the slot settings (alerts).\n\n" \
                      "The slots are ordered by startdate, enddate, id."

          do_request

          # first request without a cursor
          expect(response_status).to eq(200)
          slot_count = current_user.std_slots.count
                       # current_user.re_slots.count
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
          expect(json['paging']['limit']).to eq PAGINATION_MAX_LIMIT
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

      describe "Get slots" do
        let!(:std_slot_1) { create(:std_slot_private, owner: current_user) }
        let!(:std_slot_2) { create(:std_slot_friends, owner: current_user) }
        # let!(:re_slots) { create_list(:re_slot, 2, slotter: current_user) }

        example "Get slots - no pagination", document: :v1 do
          # TODO: fix wording
          explanation "Returns an array which includes all StandardSlots &" \
                      " ReSlots the current_user has created including" \
                      " the slot settings (alerts).\n\n" \
                      "The slots are ordered by startdate, enddate, ID."

          do_request

          expect(response_status).to eq(200)
          slot_count = current_user.std_slots.count
                       # current_user.re_slots.count
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
          expect(response_body).to include(std_slot_1.title)
          expect(response_body).to include(std_slot_2.title)
          # expect(response_body).to include(re_slots.first.title)
        end
      end
    end
  end

  get "/v1/me/friendslots" do
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
    response_field :images, "Images for the slot"
    response_field :audios, "Audio recordings for the slot"
    response_field :videos, "Videos for the slot"
    response_field :url, "direct url to fetch the slot"
    response_field :visibility, "Visibility if it's a StandardSlot"
    response_field :createdAt, "Creation datetime of the slot"
    response_field :updatedAt, "Last update of the slot"
    response_field :deletedAt, "Deletion datetime of the slot"

    let(:bob) { create(:user, :with_private_slot,
                       :with_friend_slot, :with_public_slot) }
    # let!(:re_slot) { create(:re_slot, slotter: bob) }
    let!(:friendships) {
      create(:friendship, :established,
             user: create(:user, :with_friend_slot),
             friend: current_user)
      create(:friendship, :established,
             user: current_user,
             friend: create(:user, :with_public_slot))
      create(:friendship, :established, user: bob, friend: current_user)
    }

    example "Get slots from friends", document: :v1 do
      # TODO: fix wording
      explanation "Returns an array which includes all non-private " \
                  "StandardSlots &" \
                  " ReSlots from all friends of the current user.\n\n" \
                  "This endpoint supports pagination in the same style " \
                  "as the '/me/slots' route."
      do_request

      expect(response_status).to eq(200)
      slot_count = 0
      current_user.friends.each do |friend|
        slot_count += friend.std_slots_friends.count
        slot_count += friend.std_slots_public.count
        # slot_count += friend.re_slots.count
      end
      expect(json.length).to eq slot_count
    end
  end

  get "/v1/me/media" do
    header 'Authorization', :auth_header

    let!(:slot_public) {
      create(:std_slot_public, :with_media, creator: current_user) }
    let!(:slot_private) {
      create(:std_slot_private, :with_media, creator: current_user) }
    let!(:slot_friend) do
      friend = create(:user)
      create(:friendship, :established, user: current_user, friend: friend)
      create(:std_slot_friends, :with_media, creator: friend)
    end
    # let!(:slot_group) do
    #   member = create(:user)
    #   group_slot = create(:group_slot, :with_media, creator: member)
    #   create(:membership, :active, group: group_slot.group, user: current_user)
    #   create(:membership, :active, group: group_slot.group, user: member)
    #   group_slot
    # end

    response_field :array, "containing media items as a list of MediaItem"

    example "Get media items", document: :v1 do
      explanation "Returns an array which includes all media items of " \
                  "the current user."

      do_request

      expect(response_status).to eq(200)
      expect(response_body).to include(slot_public.media_items[0].public_id)
      expect(response_body).to include(slot_private.media_items[0].public_id)
      expect(response_body).not_to include(slot_friend.media_items[0].public_id)
      # expect(response_body).not_to include(slot_group.media_items[0].public_id)
      expect(json.length).to eq(12)
    end
  end

  get "/v1/me/suggested_users" do
    header 'Authorization', :auth_header

    response_field :array, "contains potentially interesting users"

    context "no friends" do
      let!(:kaweh) { create(:user, email: 'kalirad@me.com') }

      example "Get suggested Users", document: false do
        do_request
        expect(response_status).to eq(200)
        expect(response_body).not_to include current_user.username
        expect(response_body).to include kaweh.username
      end
    end

    context "with friends" do
      let(:pending) {
        pending = create(:user)
        create(:friendship, friend: pending, user: current_user)
        pending
      }
      let(:friend) {
        friend = create(:user)
        create(:friendship, :established, friend: friend, user: current_user)
        friend
      }
      let(:kaweh) {
        kw = create(:user, email: 'kalirad@me.com')
        create(:friendship, :established, friend: current_user, user: kw)
        create(:friendship, :established, friend: kw, user: friend)
        kw
      }
      let(:foaf) {
        foaf = create(:user)
        create(:friendship, :established, friend: friend, user: foaf)
        foaf
      }
      let!(:friendship_1) { create(:friendship, :established,
                                   friend: create(:user), user: kaweh) }
      let!(:friendship_2) { create(:friendship, :established,
                                   friend: create(:user), user: friend) }
      let!(:friendship_3) { create(:friendship, :established,
                                   friend: create(:user), user: foaf) }
      let!(:friendship_4) { create(:friendship, :established,
                                   friend: pending, user: kaweh) }

      example "Get suggested Users", document: :v1 do
        explanation "Returns an array which includes Kaweh if User has no " \
                    "friends whatsoever. If User has one or more friends " \
                    "returns the friends-of-the-friends ('foafs' :)."

        do_request

        expect(response_status).to eq(200)
        expect(response_body).not_to include current_user.username
        expect(response_body).to include friendship_1.friend.username
        expect(response_body).to include friendship_2.friend.username
        expect(response_body).not_to include friendship_3.friend.username
        expect(response_body).not_to include kaweh.username
        expect(response_body).not_to include friend.username
        expect(response_body).not_to include pending.username
      end
    end
  end

  get "/v1/me/friends" do
    header 'Authorization', :auth_header

    let!(:friendship_1) { create(:friendship, :established, friend: create(:user), user: current_user) }
    let!(:friendship_2) { create(:friendship, :established, friend: create(:user), user: current_user) }
    let!(:friendship_3) { create(:friendship, :established, friend: create(:user), user: current_user) }

    response_field :array, "containing friends as a list of Users"

    example "Get friends", document: :v1 do
      explanation "Returns an array which includes all friends of " \
                  "the current user."

      do_request

      expect(response_status).to eq(200)
      expect(json[0]['id']).to eq(friendship_1['friend_id'])
      expect(json[1]['id']).to eq(friendship_2['friend_id'])
      expect(json[2]['id']).to eq(friendship_3['friend_id'])
      expect(json.length).to eq(3)
    end
  end

  get "/v1/me/slotgroups" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    response_field :id, "ID of the group"
    response_field :name, "name of the group"
    response_field :upcomingCount, "Number of upcoming group slots"
    response_field :next, "Start date and Time of the next upcoming slot"
    response_field :image, "URL of the group image"
    response_field :url, "ressource URL for the group"

    let!(:current_user) { create(:user, :with_email, :with_password,
                                 :with_3_groups, :with_3_own_groups) }

    example "Get all groups where current user is member or owner",
            document: :v1 do
      explanation "returns an array of groups"

      do_request

      expect(response_status).to eq(200)
      expect(json.size).to eq current_user.active_groups.count
      expect(json[0]).to have_key("id")
      expect(json[0]).to have_key("name")
      expect(json[0]).to have_key("image")
      expect(json[0]).to have_key("owner")
      expect(json[0]).to have_key("createdAt")
      expect(json[0]).to have_key("updatedAt")
      expect(json[0]).to have_key("deletedAt")
    end
  end

  patch "/v1/me" do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    include_context "current user response fields"

    parameter :username, "Updated username of user (max. 50 characters)"
    parameter :email, "Email of user (max. 255 characters)"
    parameter :lang, "Language of user (2 characters, ISO 639-1)"
    parameter :phone, "Phone number of user (max. 35 characters)"
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

    describe "Update current users data" do
      let(:username) { "bar" }
      let(:defaultPrivateAlerts) { '0111011100' }

      example "Update - username and default alerts",
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
        expect(json["username"]).to eq current_user.username
        # expect(json["defaultPrivateAlerts"]).to eq current_user.default_private_alerts
      end
    end

    describe "Update password" do
      parameter :password, "new password", required: true
      parameter :old_password, "valid old password", required: true

      let(:password) { "slimetot" }
      let(:old_password) { "timeslot" }

      example "Update - password", document: :v1 do
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

    describe "Set/Update user image" do
      parameter :image, "Cloudinary ID / URL", required: true

      let(:image) { "v1234567/xcvjghjkdisudgfds7iyf.jpg" }

      example "Update - user image", document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary the client updates the group with the image" \
                    " information.\n\n" \
                    "returns 200 and the users data if the image was" \
                    " successfully added or updated"
        do_request

        current_user.reload
        expect(current_user.picture).not_to be nil
        expect(current_user.picture).to eq image
        expect(response_status).to eq(200)
        expect(json).to have_key("image")
        expect(json["image"]).to eq image
      end
    end

    describe "Set location" do
      parameter :location, "ID of users home location"
      parameter :name,
                "Name of the IOS location, e.g. Timeslot Inc. (255 chars)",
                scope: :location
      parameter :thoroughfare, "Street address, Dolziger Str. 9 (255 chars)",
                scope: :location
      parameter :subThoroughfare, "house number, e.g. 9 (255 chars)",
                scope: :location
      parameter :locality, "city, e.g. Berlin (255 chars)",
                scope: :location
      parameter :subLocality,
                "neighborhood, common name, e.g. Mitte (255 chars)",
                scope: :location
      parameter :postalCode, "zip code, e.g. 94114 (32 chars)",
                scope: :location
      parameter :country, "country, e.g. Germany (255 chars)",
                scope: :location
      parameter :isoCountryCode, "Country Code, e.g. US (8 chars)",
                scope: :location
      parameter :inLandWater, "e.g. Lake Tahoe", scope: :location
      parameter :ocean, "e.g. Pacific Ocean", scope: :location
      parameter :areasOfInterest, "e.g. Volkspark Friedrichshain",
                scope: :location
      parameter :latitude, "Latitude", scope: :location
      parameter :longitude, "Longitude", scope: :location
      parameter :private_location,
                "private location for this user (true/false) [not yet " \
                "sure what it will mean technically] -> default: false",
                scope: :location

      let(:name) { "Acapulco" }

      example "Update - location", document: :v1 do
        do_request

        expect(response_status).to eq(200)
        current_user.reload
        expect(current_user.location).not_to be nil
        expect(current_user.location.name).to eq 'Acapulco'
        expect(json).to have_key("location")
        expect(json["location"]).not_to be nil
        expect(json["location"]["name"]).to eq "Acapulco"
      end
    end

    describe "Set default language for a user" do
      let(:lang) { 'de' }

      example "Update - default language", document: :v1 do
        expect(current_user[:lang]).to be(nil)

        do_request

        expect(response_status).to eq(200)
        current_user.reload
        expect(current_user[:lang]).to eq('de')
      end
    end

    describe "Turn on/off push notifications for a user" do
      let(:push) { false }

      example "Update - turn on/off push notifications",
              document: :v1 do
        expect(current_user.push).to be(true)

        do_request

        expect(response_status).to eq(200)
        current_user.reload
        expect(current_user.push).to be(false)
      end
    end
  end

  get "/v1/me/signout" do
    header "Authorization", :auth_header

    example "Sign-out User", document: :v1 do
      explanation "returns OK if current user was successfully signed out\n\n" \
                  "returns 403 if there was no current user"
      do_request

      expect(response_status).to eq(200)
      current_user.reload
      expect(current_user.auth_token).to be nil
    end
  end

  delete "/v1/me" do
    header "Authorization", :auth_header

    include_context "current user response fields"

    example "Inactivate User", document: :v1 do
      explanation "Sets 'deletedAt' attr for user who is logged in" \
                  "Doesn't delete anything.\n\n" \
                  "returns user data"
      do_request

      current_user.reload
      expect(current_user.deleted_at).not_to be nil
      expect(response_status).to eq(200)
    end
  end

  patch "/v1/me/device", :aws do
    header "Content-Type", "application/json"
    header "Authorization", :auth_header

    parameter :deviceId, "A unique device ID", required: true
    parameter :system, "A shorthand of the operating system of the device"
    parameter :version, "The version number of the devices operating system"
    parameter :token, "The device token which is used for device services"
    parameter :endpoint,
              "Boolean flag to unregister device from all extern services"

    let(:device) { create(:device, user: current_user) }
    let(:deviceId) { device[:device_id] }

    describe "Update specific device of the current user" do
      let(:token) {
        'a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2ee' }

      example "Device - Register endpoint to push notifications for a device",
              document: :v1 do
        explanation "returns OK if endpoint was successfully added\n\n" \
                    "returns 401 if auth token is invalid\n\n" \
                    "returns 422 if parameters are missing or invalid"

        expect(current_user.devices.last[:token]).to eq(nil)
        expect(current_user.devices.last[:endpoint]).to eq(nil)

        do_request

        result = current_user.reload.devices.last
        expect(response_status).to eq(200)
        expect(result[:device_id]).to eq(deviceId)
        expect(result[:token]).to eq(token)
        expect(result[:endpoint]).to eq('String')
      end

      context "Unregister device from push notification service" do
        let(:device) { create(:device, :with_endpoint, user: current_user) }
        let(:token) { device[:token] }
        let(:endpoint) { false }

        example "Device - Unregister device from push notification service",
                document: :v1 do
          explanation "returns OK if endpoint was successfully removed\n\n" \
                      "returns 401 if auth token is invalid\n\n" \
                      "returns 422 if parameters are missing or invalid"
          do_request

          expect(response_status).to eq(200)
          result = current_user.reload.devices.last
          expect(result[:device_id]).to eq(deviceId)
          expect(result[:token]).to eq(token)
          expect(result[:endpoint]).to eq(nil)
        end
      end

      context "Update default device attributes" do
        let(:system) { 'android' }
        let(:version) { '5.0b' }

        example "Device - Update default device attributes", document: :v1 do
          explanation "returns OK if endpoint was successfully removed\n\n" \
                      "returns 401 if auth token is invalid\n\n" \
                      "returns 422 if parameters are missing or invalid"
          expect(current_user.reload.devices.last[:system]).to eq('ios')
          do_request

          expect(response_status).to eq(200)
          result = current_user.reload.devices.last
          expect(result[:device_id]).to eq(deviceId)
          expect(result[:system]).to eq('android')
          expect(result[:version]).to eq('5.0b')
        end
      end
    end
  end

  post "/v1/me/add_friends" do
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
      current_user.reload
      expect(current_user.friends).to include john
      expect(current_user.friends).to include mary
      expect(current_user.requested_friends).to include alice
      expect(current_user.requested_friends).not_to include john
      expect(current_user.requested_friends).not_to include mary
      expect(current_user.requested_friends.size).to eq 4
    end
  end

  post "/v1/me/friendship/:user_id" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :user_id,
              "ID of the User for whom the friendship/request should be" \
              " invalidated.",
              required: true

    response_field :id, "ID of the other user"
    response_field :username, "Username of the other user"
    response_field :image, "URL of the other users image"
    response_field :location, "Home location of other user"
    # response_field :push, "Send push Notifications (true/false)"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"
    response_field :slotCount, "Number of slots for other user"
    response_field :reslotCount, "Number of reslots for other user"
    response_field :friendsCount, "Number of friends for other user"
    response_field :friendshipState, "[pending active, pending passive, " \
                                     "friend, stranger]"

    let(:john) { create(:user, username: "John") }
    let(:user_id) { john.id }

    example "Create or Accept Friend Requests",
            document: :v1 do
      explanation "Accepts an open friend request from other User to " \
                  "current user if one exists.\n\n" \
                  "Creates an open friend request from current user to " \
                  "other User if none exists yet.\n\n" \
                  "Returns OK and the data of the given User." \
                  "Returns 404 if the given User ID does not exist or the " \
                  "User has his account deactivated."
      do_request

      expect(response_status).to be 200
      current_user.reload
      expect(current_user.friends).not_to include john
      expect(current_user.requested_friends).to include john
      expect(response_body).to include john.username
      expect(json).to have_key('friendshipState')
      friendship = Friendship.last
      expect(json['friendshipState']).to eq friendship.humanize(current_user)
    end
  end

  delete "/v1/me/friendship/:user_id" do
    header "Accept", "application/json"
    header "Authorization", :auth_header

    parameter :user_id,
              "ID of the User for whom the friendship/request " \
              "should be invalidated.",
              required: true

    response_field :id, "ID of the other user"
    response_field :username, "Username of the other user"
    response_field :image, "URL of the other users image"
    response_field :location, "Home location of other user"
    # response_field :push, "Send push Notifications (true/false)"
    response_field :createdAt, "Creation of user"
    response_field :updatedAt, "Latest update of user in db"
    response_field :deletedAt, "Deletion of user"
    response_field :slotCount, "Number of slots for other user"
    response_field :reslotCount, "Number of reslots for other user"
    response_field :friendsCount, "Number of friends for other user"
    response_field :friendshipState, "[pending active, pending passive, " \
                                     "friend, stranger]"

    let(:john) { create(:user, username: "John") }
    let!(:friendship) {
      create(:friendship, :established, user: john, friend: current_user) }
    let(:user_id) { john.id }

    example "Unfriending / Cancel or Refuse Friend Requests",
            document: :v1 do
      explanation "Deletes the friendship if both Users are friends.\n\n" \
                  "Refuses an open friend request from other User to " \
                  "current user.\n\n" \
                  "Cancels an open friend request from current user to " \
                  "other User.\n\n" \
                  "Returns OK and the data of the given User." \
                  "Returns 404 if the given User ID does not exist or the " \
                  "User has his account deactivated."
      do_request

      expect(response_status).to be 200
      current_user.reload
      expect(current_user.friends).not_to include john
      expect(response_body).to include john.username
      expect(json).to have_key('friendshipState')
      friendship.reload
      expect(json['friendshipState']).to eq friendship.humanize
    end
  end

  post "/v1/me/remove_friends" do
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
