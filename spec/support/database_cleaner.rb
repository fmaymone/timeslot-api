RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # :deletion strategy is slightly faster than :truncation
  # (43sec vs. 47sec for 1129 tests)
  config.before(:each, :commit) do
    DatabaseCleaner.strategy = :deletion
  end

  # whenever we load seed data (via :seed flag) we need to use
  # the :truncation or :deletion strategy to really empty the database
  config.before(:each, :seed) do
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each) do
    DatabaseCleaner.start
    # HACK: to reset sorting sequence for position
    FactoryGirl.configuration.sequences[:position]
      .instance_variable_get("@value").instance_variable_set("@value", 0)
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
