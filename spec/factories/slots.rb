FactoryGirl.define do
  sequence(:title) { |n| "Slot title #{n}" }

  factory :slot do
    title
    startdate "2014-09-08 13:31:02"
    enddate "2014-09-13 22:03:24"
    note "this is a testslot"
    visibility "11"
    alerts "0101001100"
  end

  trait :with_media do
    after :create do |slot|
      FactoryGirl.create_list :slot_image, 3, mediable: slot
    end
  end
end
