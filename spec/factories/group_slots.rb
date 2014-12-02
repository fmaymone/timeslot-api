FactoryGirl.define do
  factory :group_slot, class: GroupSlot, parent: :base_slot do
    association :meta_slot, strategy: :build
    association :group, strategy: :build
  end
end
