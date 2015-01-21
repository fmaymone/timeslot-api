FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :base_slot do
    association :owner, factory: :user, strategy: :build
    visibility '11'
  end
end
