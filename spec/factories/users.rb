FactoryGirl.define do
  sequence(:username) { |n| "User #{n}" }

  factory :user do
    username

    trait :with_image do
      after :create do |group|
        create :user_image, mediable: user
      end
    end
  end
end
