#Changelog


###v0.1.3-alpha on t2s2-
Social Connect:
- don't recreate existing authToken when user matched by facebook email
- only match facebook email if timeslot email is verified (until now no email
address is verified so basically there is no matching)
- if an unverified timeslot email matches an error is returned
- return error if user tries to connect facebook account with email which is
already used by another timeslot user (no matter the verified state)


###v0.1.2-alpha on t2s2-dev
- using release tags on github for versioning
- upgrade Ruby to 2.1.6
- upgrade Rails to 4.2
- update all Gems
- fix BKD-160 create auth token on social signin if none exists


###v0.1.0-alpha on t2s2-silvio-dev
- signup/signin is possible with phone number instead of email
- user has new attributes (location, push(-notifications), default slot settings,
phone, phone verified, email verified)
- updating user password requires valid old password

- new endpoints:
    - /v1/fb-connect
    - /v1/tw-connect

- changed type of primary key to bigint for users, friendships, groups,
memberships, comments, likes, location, media_items, slot_settings,  metaslots
and slots
