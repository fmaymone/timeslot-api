# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.create(name: 'facebook')
Provider.create(name: 'twitter')

# Pseudo-User for the webview
# TODO: add email, otherwise user probably couldn't be created
User.create(username: 'webview', role: 1)

# Pseudo-User for the crawler data/slots
User.create(username: 'Timeslot Official', role: 1, email: 'info@timeslot.com')

# produces an auth_token to be enviroment variables used in TS_SLOT_WEBSHARING
# TODO after fixing tests, create also in test enviroment
