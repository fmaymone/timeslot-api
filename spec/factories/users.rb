FactoryGirl.define do
  sequence(:username) { |n| "User #{n}" }

  factory :user, aliases: [:owner, :member] do
    username

    trait :with_image do
      after :create do |user|
        create :user_image, mediable: user
      end
    end

    trait :with_own_groups do
      after :create do |user|
        create_list :group, 3, owner: user
      end
    end

    trait :with_groups do
      after :create do |user|
        create_list :membership, 3, user: user
      end
    end
  end
end