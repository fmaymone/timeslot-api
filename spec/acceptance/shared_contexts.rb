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
  response_field :rrule, "Repeating Rule for the slot"
  response_field :openEnd, "OpenEnd Boolean Flag"
  response_field :createdAt, "Creation of slot"
  response_field :updatedAt, "Last update of slot"
  response_field :deletedAt, "Delete date of slot or nil"
  response_field :description, "Description for the slot"
  response_field :location, "Location data for the slot"
  response_field :creator, "User who created the slot"
  response_field :settings,
                 "Only included if it's a slot of the current User " \
                 "(created-/friend-/re-/groupslot),\n\n" \
                 "contains User specific settings for this slot (alerts)"
  response_field :visibility,
                 "Visibiltiy of the slot (private/friend/foaf/public)"
  response_field :notes, "Notes on the slot"
  response_field :likerIds, "Array with IDs of Users who like the slot"
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

RSpec.shared_context "default slot parameter" do
  parameter :title, "Title of slot (max. 60 characters)",
            required: true
  parameter :startDate,
            "Startdate and Time of the Slot",
            required: true
  parameter :endDate,
            "Enddate and Time of the Slot (startdate + duration).",
            required: true
  parameter :rrule,
            "Repeating Rule for the Slot."
  parameter :allday,
            "The All-Day Flag indicates that a Slot lasts for one or " \
            "more complete days."
  # parameter :openEnd,
  #          "The OpenEnd Flag indicates if an user has set a specific end date to a Slot or not.",
  #          required: true
  parameter :description, "Description for the slot (max. 500 characters)"
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
  parameter :placeId, "Google Place ID", scope: :location
  parameter :privateLocation,
            "private location for this user (true/false) [not yet " \
            "sure what it will mean technically] -> default: false",
            scope: :location
end

RSpec.shared_context "user params" do
  parameter :username, "Updated username of user (max. 50 characters)"
  parameter :firstName, "Updated firstname of user (max. 50 characters)"
  parameter :middleName, "Updated middlename of user (max. 50 characters)"
  parameter :lastName, "Updated lastname of user (max. 50 characters)"
  parameter :gender, "Updated gender of user (max. 50 characters)"
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
end

RSpec.shared_context "default user response fields" do
  response_field :id, "ID of the user"
  response_field :username, "Username of the user"
  response_field :firstName, "First name of the user"
  response_field :middleName, "Middle name of the user"
  response_field :lastName, "Last name of the user"
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

  response_field :gender, "Gender of user (non-binary to allow transgender types)"
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

RSpec.shared_context "slot pagination" do
  parameter :limit, "Maximum number of slots returned." \
                    " Default is 40. Maximum is 100."
  parameter :moment, "A point in time. Query parameter to get slots " \
                     "relative to a specific moment. Must be UTC.\n" \
                     "Default is Time.zone.now (server time)."
  parameter :filter, "Query parameter to reduce the set of valid slots " \
                     "which are taken into account for the db query. " \
                     "Must be one of:\n" \
                     "- **between**: takes 2 additional parameters: " \
                     "*earliest* and *latest*. Will only return slots" \
                     " which overlap with the specified time interval. " \
                     "*Rule: startDate < latest AND endDate > earliest*." \
                     " Default **mode** is 'now', default **moment** " \
                     "== 'earliest.'\n" \
                     "- **newer**: tba\n" \
                     "Default is **none**."
  parameter :mode, "Query parameter to request slots relative to a " \
                   "given **moment**. Must be one of:\n" \
                   "- **past**: *start* before *moment*\n" \
                   "- **upcoming**: *start* after or equal *moment*\n" \
                   "- **ongoing**: *start* before & *end* after *moment*\n" \
                   "- **finished**: *start* & *end* before *moment*\n" \
                   "- **now**: *ongoing* & *upcoming* slots\n" \
                   "- **around**: limit/2 slots with *start* before " \
                   "*moment* and limit/2 slots with *start* after " \
                   "*moment*. This might miss ongoing slots.\n" \
                   "- **all**: no restriction\n" \
                   "Default is **all**."
  parameter :before, "Pagination cursor to retrieve slots which do happen" \
                     " BEFORE the slot " \
                     "represented by this cursor. If a cursor is " \
                     "send, **mode** and **moment** are ignored."
  parameter :after, "Pagination cursor to retrieve slots which do happen" \
                    " AFTER the slot represented by this cursor. If a " \
                    "cursor is send, **mode** and **moment** are ignored."
  parameter :earliest, "A point in time. No results before this moment " \
                       "will be returned. Only works with 'between' filter."
  parameter :latest, "A point in time. No results after this moment " \
                     "will be returned. Only works with 'between' filter."

  response_field :paging, "Hash containing relevant paging parameters."
  response_field :limit, "Maximum number of slots returned.",
                 scope: :paging
  response_field :mode, "Types of slots which were requested.",
                 scope: :paging
  response_field :moment, "Point-in-time which was used for the query.",
                 scope: :paging
  response_field :filter, "Type of filter which was applied to initial data.",
                 scope: :paging
  response_field :earliest,
                 "If set, no Slots which have ended before this point-in-time" \
                 " will be included in the result.",
                 scope: :paging
  response_field :latest,
                 "If set, no Slots which are starting after this point-in-time" \
                 " will be included in the result.",
                 scope: :paging
  response_field :before, "Cursor that represents the first item in the " \
                          "response dataset.", scope: :paging
  response_field :after, "Cursor that represents the last item in the " \
                         "response dataset.", scope: :paging
  response_field :data, "Array containing the result dataset."
end
