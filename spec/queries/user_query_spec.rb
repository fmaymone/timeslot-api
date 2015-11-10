require 'spec_helper'

RSpec.describe UserQuery::Relationship, type: :query do
  # TODO: figure out why Database.cleaner callbacks are not triggered for
  # this spec type
  before(:all) do
    DatabaseCleaner.strategy = :truncation, {
      except: %w(meta_slots base_slots std_slots re_slots users) }
  end

  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  before(:each) { DatabaseCleaner.start }
  after(:each) { DatabaseCleaner.clean }

  describe "common_friends" do
    skip 'pending'
  end
end
