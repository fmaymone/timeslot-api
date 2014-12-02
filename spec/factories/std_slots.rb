FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :base_slot do
    association :meta_slot, strategy: :build
    association :owner, factory: :user, strategy: :build
  end
end
