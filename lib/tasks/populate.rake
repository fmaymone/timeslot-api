# http://railscasts.com/episodes/126-populating-a-database
namespace :db do
  desc "Erase and populate database with seed data"

  task :populate => :environment do

    # delete db before start
    [MediaItem, ReSlot, GroupSlot, StdSlot, BaseSlot, MetaSlot, SlotSetting,
     User, Note, Like, Comment, Group, Membership, Friendship].each(&:delete_all)

    # start populate
    (0..5).each do

      user = FactoryGirl.create(:user, :with_3_groups, username: Faker::Name.name)
      #email: Faker::Number.number(5) + Faker::Internet.email
      #password: Faker::Internet.password

      (0..5).each do

        meta_slot = FactoryGirl.create(:meta_slot,
                                       creator: user,
                                       title: Faker::Name.title + ' ' + Faker::Name.suffix)

        slot = FactoryGirl.create(:std_slot_public,
                                  :with_notes,
                                  :with_likes,
                                  :with_comments,
                                  :with_media,
                                  owner: user,
                                  meta_slot: meta_slot)

        FactoryGirl.create_list(:slot_image, 5, mediable: slot)
        FactoryGirl.create_list(:video, 2, mediable: slot)
        FactoryGirl.create(:audio, mediable: slot)
      end
    end
  end
end
