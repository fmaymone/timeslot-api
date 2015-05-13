#Changelog


###v0.2.0-alpha on t2s2-dev
- using release tags on github for versioning
- Rails 4.2, Gems updated


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
