RSpec.shared_context "shared stuff", a: :b do
  before { @some_var = :some_value }
  def shared_method
    "it works"
  end
  let(:shared_let) { { 'arbitrary' => 'object' } }
  subject do
    'this is the subject'
  end
end

RSpec.shared_context "default slot response fields" do
  response_field :id, "ID of the slot"
  response_field :title, "Title of the slot"
  response_field :startDate, "Startdate of the slot"
  response_field :endDate, "Enddate of the slot"
  response_field :openEnd, "OpenEnd Boolean Flag"
  response_field :createdAt, "Creation of slot"
  response_field :updatedAt, "Last update of slot"
  response_field :deletedAt, "Delete date of slot or nil"
  response_field :location, "Location data for the slot"
  response_field :creator, "User who created the slot"
  response_field :settings,
                 "Only included if it's a slot of the current User " \
                 "(created-/friend-/re-/groupslot),\n\n" \
                 "contains User specific settings for this slot (alerts)"
  response_field :visibility,
                 "Visibiltiy of the slot (private/friend/foaf/public)"
  response_field :notes, "Notes on the slot"
  response_field :likes, "Likes for the slot"
  response_field :commentsCounter, "Number of comments on the slot"
  response_field :shareUrl, "Share URL for this slot, nil if not yet shared"
  response_field :images, "Images for the slot"
  response_field :audios, "Audio recordings for the slot"
  response_field :videos, "Videos recordings for the slot"
end

RSpec.shared_context "stdslot response fields" do
  include_context "default slot response fields"
  response_field :reslotsCounter, "Number of reslots for this slot"
end

RSpec.shared_context "reslot response fields" do
  include_context "stdslot response fields"
  response_field :slotter, "contains ID of the User who did reslot"
  response_field :parent, "contains ID of the original slot that was reslottet"
end

RSpec.shared_context "group slot response fields" do
  include_context "default slot response fields"
  response_field :groupId, "ID of the group the slot belongs to"
end

RSpec.shared_context "default slot parameter" do
  parameter :title, "Title of slot (max. 60 characters)",
            required: true
  parameter :startDate,
            "Startdate and Time of the Slot",
            required: true
  parameter :endDate,
            "Enddate and Time of the Slot (startdate + duration).",
            required: true
  # parameter :openEnd,
  #          "The OpenEnd Flag indicates if an user has set a specific end date to a Slot or not.",
  #          required: true
  parameter :location, "Location associated with this slot (see example)"
  parameter :media, "Media items (image/audio/video) of to the Slot " \
                    "(see example)"
  parameter :notes, "Notes for to the Slot (see example)"
  parameter :settings, "User specific settings for the slot (alerts)"
  parameter :alerts, "Alerts for the Slot", scope: :settings
end

RSpec.shared_context "ios location params" do
  parameter :name, "Name of the location, eg. Timeslot Inc. (255 chars)",
            scope: :location
  parameter :thoroughfare, "Street address, eg. Dolziger Str. 9 (255 ch.)",
            scope: :location
  parameter :subThoroughfare, "house number, eg. 9 (255 chars)",
            scope: :location
  parameter :locality, "city, e.g. Berlin (255 chars)",
            scope: :location
  parameter :subLocality, "neighborhood, common name, eg. Mitte (255 ch.)",
            scope: :location
  parameter :postalCode, "zip code, eg. 94114 (32 chars)",
            scope: :location
  parameter :country, "country, eg. Germany (255 chars)",
            scope: :location
  parameter :isoCountryCode, "Country Code, eg. US (8 chars)",
            scope: :location
  parameter :inLandWater, "eg. Lake Tahoe", scope: :location
  parameter :ocean, "eg. Pacific Ocean", scope: :location
  parameter :areasOfInterest, "eg. Volkspark Friedrichshain",
            scope: :location
  parameter :latitude, "Latitude", scope: :location
  parameter :longitude, "Longitude", scope: :location
  parameter :privateLocation,
            "private location for this user (true/false) [not yet " \
            "sure what it will mean technically] -> default: false",
            scope: :location
end

RSpec.shared_context "default user response fields" do
  response_field :id, "ID of the user"
  response_field :username, "Username of the user"
  response_field :createdAt, "Creation of user"
  response_field :updatedAt, "Latest update of user in db"
  response_field :deletedAt, "Deletion of user"
  response_field :image, "URL of the user image"
  response_field :location, "Home location of user"
  # we could need this when we can toggle notifications per friend
  # response_field :push, "Send push Notifications (true/false)"
  response_field :slotCount, "Number of visible slots for this user"
  response_field :calendarCount, "Number of visible calendars for this user"
  response_field :friendsCount, "Number of friends for this user"
end

RSpec.shared_context "current user response fields" do
  include_context "default user response fields"

  response_field :lang, "Language code (ISO 639-1)"

  response_field :email, "Email of user (max. 255 characters)"
  response_field :email_verified, "User has confirmed Email (true/false)"
  response_field :phone, "Phone number of user (max. 35 characters)"
  response_field :phone_verified, "User has confirmed phone number (true/false)"
  response_field :publicUrl, "Public URL for user on Timeslot (max. 255 chars)"
  response_field :push, "Send push Notifications (true/false)"
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

  response_field :all_my_slots_uuid, "UUID to retrive all slots related to " \
                                     "the user. (Needs further specification)"
  response_field :my_calendar_uuid, "UUID to get/add or remove slots of the " \
                                    " users 'MyCalendar'."
  # response_field :friends_calendar_uuid, "UUID to get the slots of the friends" \
  # " of the current user visible to him."
  response_field :friend_slots_uuid, "UUID for friend-visible slots of the user"
  response_field :public_slots_uuid, "UUID for public slots of the current user"

  response_field :friendships, "all connections to other users"
  response_field :memberships, "all connections to groups"
  response_field :devices, "all devices from user"
end
