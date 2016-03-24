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
User.create(username: 'tvspielfilm.de',
            role: 2,
            email: 'tv-spielfilm.crawler@timeslot.com',
            public_url: "http://tvspielfilm.de",
            picture: "https://ixquick-proxy.com/do/spg/show_picture.pl?l=english&rais=1&oiu=http%3A%2F%2Fwww.burda-news.de%2Fsites%2Fdefault%2Ffiles%2Fbilder%2FTVSpielfilm-Logo.jpg&sp=f6b3775130a04b171c78979d6f5f8f57")
User.create(username: 'residentadvisor.net',
            role: 2,
            email: 'resident-advisor.crawler@timeslot.com',
            public_url: "http://residentadvisor.net",
            picture: "https://ixquick-proxy.com/do/spg/show_picture.pl?l=english&rais=1&oiu=http%3A%2F%2Fwww.technoparade.fr%2Fwp-content%2Fuploads%2F2013%2F08%2Fresident-advisor-logo1.jpg&sp=9a346e1f9e34e708110bce3dfc8d31cb")
User.create(username: 'songkick.com',
            role: 2,
            email: 'songkick.crawler@timeslot.com',
            public_url: "http://songkick.com",
            picture: "https://ixquick-proxy.com/do/spg/show_picture.pl?l=english&rais=1&oiu=http%3A%2F%2Fwww.songkick.com%2Fblog%2Fwp-content%2Fuploads%2F2012%2F06%2FSK_badge.png&sp=64a28a9e0da93a57272f660599b8e66c")
