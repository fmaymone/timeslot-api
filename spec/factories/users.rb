FactoryGirl.define do
  sequence(:username) { |n| "User #{n}" }
  sequence(:email) { |n| "user#{n}@email.com" }
  sequence(:phone) { |n| "#{n}243#{n}" }

  factory :user, aliases: [:owner, :member, :creator] do
    username

    trait :with_email do
      email
    end

    trait :with_location do
      location
    end

    trait :with_phone do
      phone
    end

    trait :with_password do
      password 'timeslot'
    end

    trait :with_device do
      after :create do |user|
        create :device, user: user
      end
    end

    trait :with_image do
      after :create do |user|
        create :mock_image, mediable: user
      end
    end

    trait :with_real_image do
      after :create do |user|
        create :real_image, mediable: user
      end
    end

    trait :with_3_own_groups do
      after :create do |user|
        create_list :group, 3, owner: user
      end
    end

    trait :with_3_groups do
      after :create do |user|
        create_list :membership, 3, user: user
      end
    end

    trait :with_private_slot do
      after :create do |user|
        create :std_slot_private, owner: user
      end
    end

    trait :with_friend_slot do
      after :create do |user|
        create :std_slot_friends, owner: user
      end
    end

    trait :with_public_slot do
      after :create do |user|
        create :std_slot_public, owner: user
      end
    end

    trait :with_feed do
      after :create do |user|
        create :std_slot_public, owner: user # +1 activity
        create_list :comment, 3, user: user  # +3 activities
        create :like, user: user             # +1 activity
      end
    end
  end
end
