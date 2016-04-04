# http://railscasts.com/episodes/126-populating-a-database
namespace :db do
  desc "Erase and populate database with seed data"

  task :populate => :environment do

    return if Rails.env == 'production'

    # delete db before start
    [MediaItem, Note, Like, Comment, SlotSetting, StdSlot, BaseSlot, MetaSlot,
     Membership, Friendship, Passengership, Containership, Group, User].each(&:delete_all)

    # start populate
    (0..25).each do

      user = FactoryGirl.create(:user, :with_3_groups, username: Faker::Name.name)

      (0..25).each do

        meta_slot = FactoryGirl.create(:meta_slot,
                                       creator: user,
                                       title: Faker::Name.title + ' ' + Faker::Name.suffix)

        slot = FactoryGirl.create(:std_slot_public,
                                  :with_notes,
                                  :with_likes,
                                  :with_comments,
                                  :with_media,
                                  creator: user,
                                  meta_slot: meta_slot)

        group = FactoryGirl.create(:group, owner: user)
        SlotsetManager.new(current_user: user).add!(slot, group)

        tagged_user = FactoryGirl.create(:user, username: Faker::Name.name)
        UsersToSlotTagger.new(slot).tag([tagged_user.id], user)

        group_user = FactoryGirl.create(:user, username: Faker::Name.name)
        group.invite_users([group_user.id])

        slot.create_comment(user, 'This is a test comment.')
        slot.create_like(user)
        slot.create_comment(tagged_user, 'This is a test comment.')
        slot.create_like(tagged_user)
        slot.create_comment(group_user, 'This is a test comment.')
        slot.create_like(group_user)

        FactoryGirl.create_list(:slot_image, 5, mediable: slot)
        FactoryGirl.create_list(:video, 2, mediable: slot)
        FactoryGirl.create(:audio, mediable: slot)
      end
    end
  end
end
