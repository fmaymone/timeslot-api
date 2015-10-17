# make sure simple_cov also works with spring
if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start
end
