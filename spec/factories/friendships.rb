FactoryGirl.define do
  factory :friendship do
    association :user, strategy: :build
    association :friend, factory: :user, strategy: :build

    trait :invited do
      state "01"
    end

    trait :refused do
      state "10"
    end

    trait :active do
      state "11"
    end

    trait :inactive do
      state "00"
    end
  end
end
