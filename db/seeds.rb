# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.create(name: 'facebook')
Provider.create(name: 'twitter')
User.create(username: 'webview', role: 1) unless Rails.env == "test"
						# produces an auth_token to be 
						# enviroment variables used in TS_SLOT_WEBSHARING
						# TODO after fixing tests, create also in test enviroment
