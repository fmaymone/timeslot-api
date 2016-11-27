# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Provider.find_or_create_by(name: 'facebook')
Provider.find_or_create_by(name: 'twitter')

# for imports via web-importer
User.find_or_create_by(username: 'Web Importer',
                       role: 4,
                       email: 'web-importer@timeslot.com') do |user|
  user.password = ENV.fetch('WEB_IMPORTER_PASSWORD', 'Q8NUwaR4')
  # password can probably not be changed afterwards by setting/changing env var
end

# calendars with global slots
User.find_or_create_by(
  username: 'Global Importer',
  role: 4,
  email: 'global-importer@timeslot.com'
)

# apple itunes review account
User.find_or_create_by(username: 'John Appleseed',
                       role: 0,
                       email: 'john@appleseed.com') do |user|
  user.password = 'appleseed'
end
