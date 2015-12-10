RSpec::Matchers.define :include_slot do |slot|
  match do |collection|
    super_slot = slot.class.superclass.find slot.id
    collection.include? super_slot
    # collection.include? slot.becomes(slot.class.superclass)
  end

  # Optional failure messages
  failure_message do |_actual|
    "expected slot to be in collection"
  end

  failure_message_when_negated do |_actual|
    "expected slot not to be in collection"
  end

  # Optional method description
  description do
    "casts slot to its superclass and checks if it is in the collection"
  end
end
