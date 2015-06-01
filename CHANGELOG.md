#Changelog

## v0.4.0 on t2s2-silvio-dev
- accept empty endDate for slots. It will internally be set to the end of the
start day if start before midday and to middle of next day if start_date after
midday, but end_date will not be returned via JSON
- user has now an ios_location as home address (tough it's only called 'location'
- json now mostly has nested objects instead of only the IDs
user: locationId

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
