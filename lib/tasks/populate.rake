namespace :db do
  desc "Erase and populate database with seed data"
  task :populate => :environment do

    # delete db before start
    [MediaItem, StdSlot, BaseSlot, MetaSlot, User].each(&:delete_all)

    # start populate
    (0..100).each do

      new_user = FactoryGirl.create(:user,
                                    :with_email,
                                    :with_password,
                                    :with_image)
      (0..20).each do

        slot = FactoryGirl.create(:std_slot_public, owner: new_user)
        FactoryGirl.create_list(:slot_image, 5, mediable: slot)
        FactoryGirl.create_list(:video, 2, mediable: slot)
        FactoryGirl.create(:audio, mediable: slot)
      end
    end
  end
end
