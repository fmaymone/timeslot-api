# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.create(name: 'facebook')
Provider.create(name: 'twitter')

# Admin-User for the import manager
# NOTE: The password is the short form of the cite: 'The more I know the science the more I believe in God'
# User.create(username: 'Timeslot Import (Admin)',
#             role: 0, # TODO: the user could not be used if the role is not 0
#             email: 'import@timeslot.com',
#             password: 'tmiktstmibig') # TODO: move to env

# Pseudo-User for the crawler data/slots aka sources
User.create(username: 'Timeslot Official',
            role: 1,
            email: 'info@timeslot.com')
# for imports via web-importer
User.create(username: 'Web Importer',
            role: 4,
            email: 'web-importer@timeslot.com')
# calendars with global slots
User.create(username: 'Global Importer',
            role: 4,
            email: 'global-importer@timeslot.com')
