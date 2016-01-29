# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.create(name: 'facebook')
Provider.create(name: 'twitter')

# Pseudo-User for the crawler data/slots aka sources
User.create(username: 'Timeslot Official',
            role: 1,
            email: 'info@timeslot.com')
User.create(username: 'dfb.de',
            role: 2,
            email: 'dfb.crawler@timeslot.com',
            public_url: "http://dfb.de",
            picture: "https://upload.wikimedia.org/wikipedia/de/thumb/a/a9/Deutscher_Fu%C3%9Fball-Bund_logo.svg/600px-Deutscher_Fu%C3%9Fball-Bund_logo.svg.png")
User.create(username: 'moviepilot.de',
            role: 2,
            email: 'moviepilot.crawler@timeslot.com',
            public_url: "http://moviepilot.de",
            picture: "http://www.goldenerwesten.net/neu/wp-content/uploads/2011/04/moviepilot_logo.jpg")
