FactoryGirl.define do
  sequence(:device_id) { |n| "sn-#{n}34628734108347867654395#{n}" }

  factory :device, class: Device do
    association :user, strategy: :build
    device_id
    system 'ios'
    version '6.0'
    push true
  end

  trait :with_endpoint do
    token 'a43ea436c1eea1d5ebdcd86f46577d664fd28ce4f716350b9adff279e1bbc2ee'
    endpoint 'arn:aws:sns:us-west-2:293488554927:endpoint/APNS_SANDBOX/Timeslot-iOS/bac63567-f197-3aa2-8e24-77e567cfa042'
  end
end
