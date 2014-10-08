require 'faker'

FactoryGirl.define do
  factory :baseslot do
    title { Faker::Lorem.word }
    startdate '2014-09-08 13:31:02'
    enddate '2014-09-13 22:03:24'

    factory :baseslot_with_slots do
      after(:create) do |baseslot|
        create_list(:slot, 2, baseslot: baseslot)
      end
    end
  end

  trait :with_one_slot do
    after :create do |baseslot|
      create_list(:slot, 1, baseslot: baseslot)
    end
  end

  trait :with_slots do
    # Usage:
    # @baseslot_with_slots = create(:baseslot, :with_slots, number_of_slots: 6)
    ignore do
      number_of_slots 3
    end

    after :create do |baseslot, evaluator|
      create_list(:slot, evaluator.number_of_slots, baseslot: baseslot)
    end
  end
end
