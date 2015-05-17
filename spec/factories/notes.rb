FactoryGirl.define do

  factory :note do
    slot
    sequence(:title) { |n| "Title for Note #{n}" }
    content "Liebe ist ein Kind der Freiheit!"
  end
end
