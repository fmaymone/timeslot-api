# mass population
# http://railscasts.com/episodes/126-populating-a-database
namespace :db do
  desc "Erase and populate database with seed data"

  task :populate => :environment do
    require 'populator'
    require 'faker'

    # delete db before start
    [MediaItem, StdSlot, BaseSlot, MetaSlot, User].each(&:delete_all)

    # start populate
    User.populate(5000) do |user|

      user.username = Faker::Name.name
      user.email = Faker::Number.number(5) + Faker::Internet.email
      user.push = false

      MetaSlot.populate(20) do |slot|

        slot.creator_id = user.id
        slot.title = Populator.words(4..5).titleize #Faker::Name.title
        slot.start_date = 2.years.ago..2.years.since
        slot.end_date = 2.years.ago..2.years.since
        slot.open_end = ['true', 'false']

        #FactoryGirl.create_list(:slot_image, 5, mediable: slot)
        #FactoryGirl.create_list(:video, 2, mediable: slot)
        #FactoryGirl.create(:audio, mediable: slot)
      end
    end
  end
end
