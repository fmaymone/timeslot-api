FactoryGirl.define do
  factory :passengership do
    association :slot, strategy: :build
    association :user, strategy: :build

    trait :add_media_permitted do
      add_media_permission true
    end

    trait :show_in_schedule do
      show_in_my_schedule true
    end

    after :create do |passengership|
      passengership.user.follow(passengership.slot)
    end
  end
end
