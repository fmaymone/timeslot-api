namespace :db do
  desc "Edit database data"

  task :edit => :environment do

    return if Rails.env == 'production'

    User.all.each do |user|

      (0..10).each do

        meta_slot = FactoryGirl.create(:meta_slot,
                                       creator: user,
                                       title: Faker::Name.title + ' ' + Faker::Name.suffix)

        FactoryGirl.create(:std_slot_public,
                           creator: user,
                           meta_slot: meta_slot)
      end
    end
  end
end
