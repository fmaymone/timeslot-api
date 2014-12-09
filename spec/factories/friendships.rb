FactoryGirl.define do
  factory :friendship do
    association :user, strategy: :build
    association :friend, factory: :user, strategy: :build
    state '00'

    trait :established do
      state '11'
    end
  end

  trait :deleted do
    deleted_at Time.zone.now
  end
end
