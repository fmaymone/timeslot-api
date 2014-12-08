FactoryGirl.define do
  factory :membership do
    association :user, strategy: :build
    association :group, strategy: :build
    notifications
    invited
  end

  trait :notifications do
    notifications true
  end

  trait :invited do
    state "011"
  end

  trait :active do
    state "111"
  end

  trait :inactive do
    state "000"
  end

  trait :left do
    state "100"
  end
end
