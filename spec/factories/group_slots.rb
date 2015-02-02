FactoryGirl.define do
  factory :group_slot, class: GroupSlot, parent: :slot do
    association :group, strategy: :build
  end
end
