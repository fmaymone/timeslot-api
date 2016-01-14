RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :commit) do
    DatabaseCleaner.strategy = :deletion
  end

  config.after(:each, :commit) do
    DatabaseCleaner.strategy = :transaction
  end

  # just to be on the safe side
  config.after(:all, :commit) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each, :redis) do
    DatabaseCleaner.strategy = :deletion
  end

  config.after(:each, :redis) do
    DatabaseCleaner.strategy = :transaction
    RedisStorage.flush
  end

  # whenever we load seed data (via :seed flag) we need to use
  # really empty the database afterwards
  config.after(:all, :seed) do
    DatabaseCleaner.clean_with(:truncation)
  end

  # keep some tables intact during testruns
  config.before(:all, :keep_data) do
    DatabaseCleaner.strategy = :truncation, {
      except: %w(meta_slots base_slots std_slots re_slots users friendships) }
  end

  config.after(:all, :keep_data) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
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
