FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :base_slot do
  # factory :std_slot do
    association :meta_slot, strategy: :build
    footest "StdSlot"
  end
end
