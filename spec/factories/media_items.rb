FactoryGirl.define do
  sequence(:position, 0) # there is a hack in spec/support/database_cleaner.rb
  # to reset this sequence to 0 after a spec was run
  sequence(:public_id) { |n| "dfhjghjkdisudgfds7iy#{n}" }
  sequence(:title) { |n| "Title #{n}" }

  factory :slot_image, class: "MediaItem" do
    association :mediable, factory: :slot
    media_type "image"
    public_id
    position
    creator
    title
  end

  factory :mock_image, class: "MediaItem" do
    association :mediable, factory: :user
    media_type "image"
    public_id
    creator
    title
  end

  factory :real_image, class: "MediaItem" do
    association :mediable, factory: :user
    media_type "image"
    public_id "sample"
    creator
    title
  end

  factory :real_slot_image, class: "MediaItem" do
    association :mediable, factory: :slot
    media_type "image"
    public_id "sample"
    position
    creator
    title
  end

  factory :audio, class: "MediaItem" do
    association :mediable, factory: :slot
    media_type "audio"
    public_id
    position
    creator
    title
  end

  factory :video, class: "MediaItem" do
    association :mediable, factory: :slot
    media_type "video"
    public_id
    position
    creator
    title
  end
end
