# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.create(name: 'facebook')
Provider.create(name: 'twitter')

unless Rails.env == "test"
  # Pseudo-User for the webview
  User.create(username: 'webview', role: 1)
  # Pseudo-User for the crawler data/slots
  User.create(username: 'Timeslot Crawler', role: 1,
              password: ENV['TS_CRAWLER_PASSWORD'],
              email: 'ts-crawler@timeslot.com',
              auth_token: ENV['TS_CRAWLER_KEY'])
end
# produces an auth_token to be enviroment variables used in TS_SLOT_WEBSHARING
# TODO after fixing tests, create also in test enviroment
