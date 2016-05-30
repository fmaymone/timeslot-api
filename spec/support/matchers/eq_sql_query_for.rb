RSpec::Matchers.define :eq_sql_query_for do |showables|
  match do |relations|
    relations.each_with_index do |relation, i|
      return false if showables[i] == nil
      return false unless relation.to_sql == showables[i].to_sql
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
