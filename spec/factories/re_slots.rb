FactoryGirl.define do
  factory :re_slot, class: ReSlot, parent: :slot do
    association :slotter, factory: :user, strategy: :build
    association :predecessor, factory: :std_slot, strategy: :build

    initialize_with {
      ReSlot.create_from_slot(predecessor: predecessor, slotter: slotter)
    }
  end
end
