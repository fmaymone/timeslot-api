namespace :db do
  desc "Erase and populate database with seed data"
  task :populate => :environment do

    # delete db before start
    [MediaItem, StdSlot, BaseSlot, MetaSlot, User].each(&:delete_all)

    # start populate
    (0..50000).each do

      new_user = User.create(username: Faker::Name.name,
                             email: Faker::Internet.email,
                             password: Faker::Internet.password)

      (0..20).each do

        slot = FactoryGirl.create(:std_slot_public,
                                  owner: new_user,
                                  title: Faker::Name.title)
        #FactoryGirl.create_list(:slot_image, 5, mediable: slot)
        #FactoryGirl.create_list(:video, 2, mediable: slot)
        #FactoryGirl.create(:audio, mediable: slot)
      end
    end
  end
end
