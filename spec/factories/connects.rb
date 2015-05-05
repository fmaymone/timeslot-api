FactoryGirl.define do
  # default provider is facebook
  factory :connect do
    user
    social_id 10152854206708061

    after(:build) do |connect|
      Rails.application.load_seed
      connect.provider = Provider.find_by name: 'facebook'
    end

    trait :twitter do
      social_id 3186786310
      provider Provider.find_by name: 'twitter'
    end
  end
end
