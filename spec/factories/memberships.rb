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

  trait :refused do
    state "001"
  end

  trait :active do
    state "111"
    after :create do |membership|
      membership.user.follow(membership.group)
    end
  end

  trait :inactive do
    deleted_at Time.zone.now
  end

  trait :left do
    state "100"
  end
end
