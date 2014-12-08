FactoryGirl.define do
  factory :base_slot do
    association :meta_slot, strategy: :build
  end

  trait :with_media do
    after :create do |base_slot|
      create_list :slot_image, 3, mediable: base_slot
    end
  end
end
