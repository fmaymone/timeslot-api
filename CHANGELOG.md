#Changelog

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
