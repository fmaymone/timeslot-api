FactoryGirl.define do
  factory :re_slot, class: ReSlot, parent: :slot do
    association :slotter, factory: :user, strategy: :build
    association :predecessor, factory: :std_slot, strategy: :build

    # need to figure out why this doesn't use the meta slot of the
    # predecessor if not explictly set like this
    # create(:re_slot, predecessor: slot, meta_slot: slot.meta_slot) }
    initialize_with {
      ReSlot.create_from_slot(predecessor: predecessor, slotter: slotter)
    }
  end
end
