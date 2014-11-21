FactoryGirl.define do
  factory :base_slot do
    association :meta_slot, strategy: :build
    footest "BaseSlot"
  end
end
