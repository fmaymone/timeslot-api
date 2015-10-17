# make sure simple_cov also works with spring
if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
end

# unfortunately simple-cov results are not correct with spring
# to get correct results I need to disable spring via
# DISABLE_SPRING=true rspec
