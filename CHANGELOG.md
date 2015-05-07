#Changelog

###Changes since version from 27.4.15
- signup/signin is possible with phone number instead of email
- user has new attributes (location, push(-notifications), default slot settings,
phone, phone verified, email verified)
- updating user password requires valid old password

- new endpoints:
    - /v1/fb-connect
    - /v1/tw-connect

- changed type of primary key to bigint for users, friendships, groups,
  memberships, comments, likes, location, media_items, slot_settings,  metaslots and slots
