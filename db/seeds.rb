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
User.create(username: 'webview', role: 1)
# TS_SLOT_WEBSHARING needs the auth_token of this 'webview' user as env variable

# Pseudo-User for the crawler data/slots
User.create(username: 'Timeslot Official', role: 1, email: 'info@timeslot.com')
