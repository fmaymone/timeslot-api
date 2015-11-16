require 'documentation_helper'

resource "Me" do
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

  # TODO: remove duplication in user acceptance spec
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
        # TODO: change in step2 of user image refactoring
        expect(
          json.except('image', 'friendships', 'friendsCount', 'reslotCount',
                      'slotCount', 'memberships', 'location')
        ).to eq(current_user.attributes.as_json
                 .except('auth_token', 'password_digest', 'role',
                         'picture',
                         'device_token', 'location_id')
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

    describe "Set image for User - new style" do
      parameter :picture, "Cloudinary ID / URL", required: true

      let(:picture) { "v1234567/xcvjghjkdisudgfds7iyf.jpg" }

      example "Update current user - set user image", document: :v1 do
        explanation "First a cloudinary signature needs to be fetched by the" \
                    " client from the API. After uploading the image to" \
                    " cloudinary the client updates the group with the image" \
                    " information.\n\n" \
                    "returns 200 and the users data if the image was" \
                    " successfully added or updated"
        do_request

        current_user.reload
        expect(current_user.picture).not_to be nil
        expect(current_user.picture).to eq picture
        expect(response_status).to eq(200)
        # expect(json).to have_key("picture")
        # expect(json).not_to have_key("image")
        # expect(json["picture"]).to eq picture
      end
    end

    describe "Set location for User" do
      parameter :location, "ID of users home location"
      parameter :name, "Name of the IOS location, e.g. Timeslot Inc. (255 chars)",
                scope: :location
      parameter :thoroughfare, "Street address, Dolziger Str. 9 (255 chars)",
                scope: :location
      parameter :subThoroughfare, "house number, e.g. 9 (255 chars)",
                scope: :location
      parameter :locality, "city, e.g. Berlin (255 chars)",
                scope: :location
      parameter :subLocality, "neighborhood, common name, e.g. Mitte (255 chars)",
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

      example "Update current user - set location", document: :v1 do
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

      example "Update current user - set default language", document: :v1 do
        expect(current_user[:lang]).to be(nil)

        do_request

        expect(response_status).to eq(200)
        current_user.reload
        expect(current_user[:lang]).to eq('de')
      end
    end

    describe "Turn on/off push notifications for a user" do
      let(:push) { false }

      example "Update current user - turn on/off push notifications", document: :v1 do
        expect(current_user.push).to be(true)

        do_request

        expect(response_status).to eq(200)
        current_user.reload
        expect(current_user.push).to be(false)
      end
    end
  end

  delete "/v1/me" do
    header "Authorization", :auth_header

    include_context "current user response fields"

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
end
