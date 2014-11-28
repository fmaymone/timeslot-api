FactoryGirl.define do
  factory :re_slot, class: ReSlot, parent: :base_slot do
    association :meta_slot, strategy: :build
    association :slotter, factory: :user, strategy: :build
    association :predecessor, factory: :std_slot, strategy: :build
    predecessor_type StdSlot.model_name.param_key
    sub_type ReSlot.model_name.param_key
  end
end
