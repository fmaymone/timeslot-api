FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :slot do
    association :owner, factory: :user, strategy: :build
  end

  factory :std_slot_private, class: StdSlotPrivate, parent: :std_slot do
  end

  factory :std_slot_friends, class: StdSlotFriends, parent: :std_slot do
  end

  factory :std_slot_public, class: StdSlotPublic, parent: :std_slot do
  end
end
