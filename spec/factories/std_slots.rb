FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :slot do
    association :owner, factory: :user, strategy: :build

    # TODO: remove visibility and traits
    visibility '00' # private

    trait :publicslot do
      visibility '11'
    end

    trait :friendslot do
      visibility '01'
    end
  end

  factory :std_slot_private, class: StdSlotPrivate, parent: :std_slot do
    visibility '00'
  end

  factory :std_slot_friends, class: StdSlotFriends, parent: :std_slot do
    visibility '01'
  end

  factory :std_slot_public, class: StdSlotPublic, parent: :std_slot do
    visibility '11'
  end
end
