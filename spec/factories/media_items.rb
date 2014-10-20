# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media_item do
    slot
    media_type "image"
    public_id "foobar"
    ordering 1
  end
end
