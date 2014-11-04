FactoryGirl.define do
  sequence(:username) { |n| "User #{n}" }

  factory :user, aliases: [:owner, :member] do
    username

    trait :with_image do
      after :create do |user|
        create :user_image, mediable: user
      end
    end
  end
end
