FactoryGirl.define do
  factory :re_slot, class: ReSlot, parent: :base_slot do
    association :meta_slot, strategy: :build
    association :predecessor, factory: :user, strategy: :build
  end
end
