FactoryGirl.define do
  sequence(:ordering, 1) { |n| n % 5 }
  sequence(:public_id) { |n| "cloudinary-#{n}" }

  factory :media_item do
    slot
    media_type "image"
    public_id
    ordering
  end
end
