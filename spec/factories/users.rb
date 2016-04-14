FactoryGirl.define do
  sequence(:username) { |n| "User #{n}" }
  sequence(:email) { |n| "user#{n}@email.com" }
  sequence(:phone) { |n| "#{n}243#{n}" }

  factory :user, aliases: [:owner, :member, :creator] do
    username

    trait :gs_category do
      role 'global_slot_category'
      username "Cinema"
      picture "https://farm4.staticflickr.com/3779/12370592085_09577409bc_z.jpg"
      user_uuid '4870f9d3-a629-9578-edcc-3e6c954baeba'
    end

    trait :with_email do
      email
    end

    trait :with_location do
      location
    end

    trait :with_picture do
      picture 'www.looking.good'
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

    trait :with_3_friends do
      after :create do |user|
        create_list :friendship, 3, :established, user: user
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

    trait :with_foaf_slot do
      after :create do |user|
        create :std_slot_foaf, owner: user
      end
    end

    trait :with_public_slot do
      after :create do |user|
        create :std_slot_public, owner: user
      end
    end
  end
end
