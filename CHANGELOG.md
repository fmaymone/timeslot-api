#Changelog

##Changes since version from 27.4.15
- email is not requiered anymore for user creation
- signup/signin is possible with phone number instead of email


- new endpoints:

- changed type of primary key to bigint for users, friendships, groups,
  memberships, comments, likes, location, media_items, slot_settings,  metaslots and slots

TODO:
- add creator for notes and media items
- rename base_slot_id to slot_id in likes, notes
