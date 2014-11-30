FactoryGirl.define do
  factory :std_slot, class: StdSlot, parent: :base_slot do
    association :meta_slot, strategy: :build
    sub_type StdSlot.model_name.param_key
  end
end
