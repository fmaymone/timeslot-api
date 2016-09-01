FactoryGirl.define do
  factory :global_slot, class: GlobalSlot, parent: :slot do
    slot_uuid 'c4c59de8-83ca-8500-274b-fe16e5ef7a71'

    trait :with_details do
      url "http://www.dfb.de/europa-league/saisonplan?spieledb_path=matches32"
      after :create do |slot|
        create :note,
               title: 'Description',
               content: "Champions League, 2015/2016, Gruppe A",
               slot: slot
        create :slot_image,
               mediable: slot,
               public_id: 'http://assets.dfb.de/public/uploads/c46d55d78dc6',
               creator: slot.creator
      end
    end

    trait :without_description do
      slot_uuid '6edd205c-0b54-d9dd-0fcd-ab08eef9aee8'
    end
  end
end
