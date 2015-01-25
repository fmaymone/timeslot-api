FactoryGirl.define do
  sequence(:username) { |n| "User #{n}" }
  sequence(:email) { |n| "user#{n}@email.com" }

  factory :user, aliases: [:owner, :member] do
    username
    email
    password "foobar"

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
  end
end
