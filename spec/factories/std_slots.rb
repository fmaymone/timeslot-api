FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :base_slot do
    association :user, strategy: :build
    footest "StdSlot"
  end
end
