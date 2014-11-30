FactoryGirl.define do
  factory :base_slot do
    sub_type BaseSlot.model_name.param_key
  end
end
