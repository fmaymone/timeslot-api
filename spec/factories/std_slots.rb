FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :slot do
    association :owner, factory: :user, strategy: :build
    visibility '00' # private

    trait :publicslot do
      visibility '11'
    end

    trait :friendslot do
      visibility '10'
    end
  end
end
