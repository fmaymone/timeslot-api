FactoryGirl.define do
  factory :note, class: Note do
    slot
    sequence(:title) { |n| "Title for Note #{n}" }
    content "Liebe ist ein Kind der Freiheit!"
    creator
  end
end
