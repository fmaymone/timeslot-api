#Changelog

## upcoming
- this release needs MIGRATION
- fix and improver follower model
- ReSlots can have different visibilities now
- Slots support user-tags, will create a reslot for the tagged user
- allow searching through users friends
- update Gems, migrate Airbrake to 5.0
- reactivate Bullet, optimize several n+1 queries
- reslot counter returns number based on visibility
- use STI feature of Rails where DB-Type column has the class that gets loaded
- FIX email addresses are matched case-insensitive now
- remove deprecated location and globalslots code
- some updates for global slot locations
- several other fixes and optimizations


## v0.9.0
- this release needs MIGRATION, SEED, new ENV_VARs
- Improvements for Activities (Remove, MultiLanguage)
- Search and Reslots Globalslots
- update User AuthToken on signup if it was null
- freeze Airbrake Gem Version
- add logging for job monitoring
- FIX some issues with counters


## v0.8.3
- [TML-137/138/109] Forward Predecessors + Push Integration into Activity Workflow and Improve Activity Removal #151
- [TML-116] FIX activity feed distributing and removals + specs #149
- several customisations for befriending (new routes which accept only one user)
- don't renew auth_token on signin
- more json changes for ios


## v0.8.2
- upgrade to Rails 4.2.5
- friend-of-friend visibility (foaf) for std_slots
- user and group image now directly in the table instead of media_items
- me-controller which has
  - show
  - update
  - inactivate
  - signout
  - my_slots
  - my_media
  - update_device
  - TODO: add_friends / remove_friends / slot_from_friends
- only slot creator can update slot metadata
- return 404 Not Found if pundit check fails
- return 401 also when policies fail because of missing current user
- FIX for invalid email on password reset
- FIX for some policies valid but current_user didn't exist
- FIX for sending out activities of NOW private slots
- Improve Performance of DB queries for me/slots and slots/demo
- disable alerts in json (was expensive and unused)
- add counter cache columns for likes, comments, re_slots
- new activity aggregation policies


## v0.8.1
- many updates for activity stream
- activity as concern, composition instead of inheritance
- re-enable postgres prepared statements
- several Bug fixes (293, 294, disallow reslot of private slot)


## v0.8.0
- upgrade ruby to 2.2.3
- pagination for user slots and demo slots
- activity feed using Redis
- add simple_cov, a tool for measuring test coverage
- bug fixes and performance optimizations
- new env vars for:
  - PAGINATION_DEFAULT_FILTER
  - PAGINATION_DEFAULT_LIMIT
  - PAGINATION_MAX_LIMIT
  - INLINE_WORKERS
  - PG_EXPLAIN


## v0.7.1 on tsinc-alpha
- fix for reslot delete, doesn't remove parent attributes anymore
- sucker punch jobs refactoring
- better airbrake error messages
- no reslots in demo endpoint
- duplicate detection for web-reslots
- optimizing slots collection for alerts check (should lower db hits)
- new env vars for:
  - RACK_TIMEOUT
  - DEMO_SLOTS_COUNT


## v0.7.0 on tsinc-alpha
- demo endpoint to get the latest 15 stdslots & latest 15 reslots from all users
- new endpoint to get all (accessible) media items of a specific user
- support devices for users
- integration of Apple Push Notifications via AWS SNS (liking, commenting)
- support for I18n
- including sucker punch for asynchronous job processing
- support searching the backend database form the client
- add CORS-Header (to make web-reslot demo work)
- add endpoint to receive crawler slot which becomes a reslot
- disable prepared statements for postgres
- increase rack-timeout from 5 to 15 seconds
- hide passwords from logs
- new relic integration
- fix airbrake integration


## v0.6.3 on t2s2-dev
- the daily fix for open_end


## v0.6.2 on t2s2-dev
- fix more issues with open_end slots


## v0.6.1 on t2s2-dev
- allow empty string for enddate if it's a slot with open end


## v0.6.0 on t2s2-dev
- add title to media items of type voice/audio
- change type of media items duration from int to float
- rename voice to audio
- rename photo to image
- rename clyid to publicId


## v0.5.3 on t2s2-dev
- increase length of media item local_id from 64 to 512


## v0.5.2 on t2s2-dev
- unify slot media items into one array with type info for every item


## v0.5.1 on t2s2-silvio-dev
- fix whitelisted location attributes from snake_case to camelCase
- re-add media items grouped by type to not make Alex depended on Antonios changes


## v0.5.0 on t2s2-dev
- when setting a slot location: renamed json key from iosLocation to location
- unify slot media items in one array called 'media' instead of separate arrays
  for photo, voice and video, added item type info for every item

### change attributes for Ios Location:
- remove street, city, postcode, auid
- add thoroughfare, sub_thoroughfare, locality, sub_locality, administrative_area,
  sub_administrative_area, postal_code, iso_country_code, in_land_water, ocean,
  areas_of_interest
- increase name, country to 255 chars


## v0.4.3 on t2s2-silvio-dev
- accept local identifier for user image and return it in JSON
- accept local identifier for group image and return it in JSON
- image of a user and group is now a hash with keys clyid and localId
- FIX bug where slot can not be updated with a location


## v0.4.2 on t2s2-silvio-dev
- return only upcoming friends slots sorted by startdate
- accept local identifier for slot media items and return it in JSON


## v0.4.1 on t2s2-silvio-dev
- increase max. slot title length from 48 to 60
- set facebook email as timeslot email if none is set
- use new timeslot email addresses for AWS SES
- render group membership state as string instead of bits


## v0.4.0 on t2s2-silvio-dev
- accept empty endDate for slots. It will internally be set to the end of the
start day if start before midday and to middle of next day if start_date after
midday, but end_date will not be returned via JSON
- user has now an ios_location as home address (tough it's only called 'location'
- json now mostly has nested objects instead of only the IDs
user: locationId
slot: creatorId, groupId and locationId
group: groupId => id, ownerId
- update ERDs


## v0.3.0 on t2s2-dev
- use Puma as Webserver on Heroku instead of Unicorn

### support for IOS Location
- add slot now accepts a complete address


## v0.2.1 on t2s2-silvio-dev
- fix bug where auth_token was not persisted on social signin


## v0.2.0 on t2s2-silvio-dev
- return full user attributes on signup/signin

### new attributes for User:
- location_name (string) (max 128) until we have a proper location handling
- device_token (string) (max 128) ios device token for push notifications

### adding AWS SDK
- use AWS SES for sending password reset email


## v0.1.3
### Social Connect
- don't recreate existing authToken when user matched by facebook email
- only match facebook email if timeslot email is verified (until now no email
address is verified so basically there is no matching)
- if an unverified timeslot email matches an error is returned
- return error if user tries to connect facebook account with email which is
already used by another timeslot user (no matter the verified state)


## v0.1.2-alpha on t2s2-dev
- using release tags on github for versioning
- upgrade Ruby to 2.1.6
- upgrade Rails to 4.2
- update all Gems
- fix BKD-160 create auth token on social signin if none exists


## v0.1.0-alpha on t2s2-silvio-dev
- signup/signin is possible with phone number instead of email
- user has new attributes (location, push(-notifications), default slot settings,
phone, phone verified, email verified)
- updating user password requires valid old password
- changed type of primary key to bigint for users, friendships, groups,
memberships, comments, likes, location, media_items, slot_settings,  metaslots
and slots

### new endpoints:
- /v1/fb-connect
- /v1/tw-connect
