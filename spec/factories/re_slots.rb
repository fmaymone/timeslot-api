FactoryGirl.define do
  factory :re_slot, class: ReSlot, parent: :base_slot do
    association :slot_setting, strategy: :build
    association :predecessor, factory: :user, strategy: :build
  end
end
