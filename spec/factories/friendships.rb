FactoryGirl.define do
  factory :friendship do
    association :user, strategy: :build
    association :friend, factory: :user, strategy: :build

    trait :established do
      state "11"
    end
  end
end
