FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :base_slot do
    association :slot_setting, strategy: :build
    footest "StdSlot"
  end
end
