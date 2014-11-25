FactoryGirl.define do
  factory :re_slot do
  # factory :re_slot, class: ReSlot, parent: :base_slot do
    association :meta_slot, strategy: :build
  end
end
