# mass population
# http://railscasts.com/episodes/126-populating-a-database
namespace :db do
  desc "Erase and populate database with seed data"

  task :populate => :environment do

    # delete db before start
    #[MediaItem, StdSlot, BaseSlot, MetaSlot, User].each(&:delete_all)

    # start populate
    (0..1000).each do

      user = User.create(username: Faker::Name.name
                         #email: Faker::Number.number(5) + Faker::Internet.email
                         #password: Faker::Internet.password
      )

      (0..100).each do

        meta_slot = FactoryGirl.create(:meta_slot,
                                       creator: user,
                                       title: Faker::Name.title + ' ' + Faker::Name.suffix)

        FactoryGirl.create(:std_slot_public,
                           owner: user,
                           meta_slot: meta_slot)

        #FactoryGirl.create_list(:slot_image, 5, mediable: slot)
        #FactoryGirl.create_list(:video, 2, mediable: slot)
        #FactoryGirl.create(:audio, mediable: slot)
      end
    end
  end
end
