RSpec::Matchers.define :eq_sql_query_for do |showables|

  match do |collection|
    showables.each_with_index do |showable, i|
      return false unless showable.to_sql == collection[i].to_sql
    end
  end

  # Optional failure messages
  failure_message do |_actual|
    "expected collections to contain the same query objects"
  end

  failure_message_when_negated do |_actual|
    "expected collection not to contain the same query objects"
  end

  # Optional method description
  description do
    "compares the sql issued by all query objects inside a collection"
  end
end
