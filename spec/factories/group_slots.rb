FactoryGirl.define do
  factory :group_slot, class: GroupSlot, parent: :slot do
    association :group, strategy: :build
  end

  factory :group_slot_members, class: GroupSlotMembers, parent: :group_slot do
  end

  factory :group_slot_public, class: GroupSlotPublic, parent: :group_slot do
  end
end
