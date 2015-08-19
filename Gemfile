source 'https://rubygems.org'

ruby '2.1.6'

gem 'rails', '4.2.1'

gem 'rails-api', '0.4.0'

gem 'pg', '0.18.2'

# Authentication (to use ActiveModel has_secure_password)
gem 'bcrypt', '3.1.10'

# Authorization
gem "pundit", '1.0.1'

# JSON
gem 'jbuilder', '2.3.0'
gem 'oj', '2.12.9'
gem 'oj_mimic_json', '1.0.1'

# for heroku
gem 'puma', '2.11.3', platforms: :ruby # exclude installation on Windows
gem "rack-timeout", '0.2.4'
gem 'rails_12factor', '0.0.3', group: :production

# third party services
gem 'cloudinary', '1.1.0'
gem 'airbrake', '4.3.0'
gem 'aws-sdk', '2.1.7'
gem 'newrelic_rpm', '3.12.1.298'

# use pry also on heroku
gem 'pry-rails', '0.3.4'

# Worker (background processing)
gem 'sucker_punch', '1.5.0'

group :development do
  gem "rails-erd", '1.4.0'

  gem "railroady", '1.3.0'

  gem "rails_best_practices", '1.15.7'

  gem "rubocop", '0.32.1'

  gem "rubocop-rspec", '1.3.0'
end

group :development, :test do
  gem 'pry-byebug', '3.1.0'

  gem 'pry-doc', '0.8.0'
  
  gem 'spring', '1.3.6'

  gem 'spring-commands-rspec', '1.0.4'

  gem 'guard-rspec', '4.5.2'

  gem 'rb-fsevent', '0.9.5'

  gem 'bullet', '4.14.7'

  gem 'vcr', '2.9.3'

  gem 'webmock', '1.21.0'

  gem 'tzinfo-data', '1.2015.5', platforms: [:mingw, :mswin, :x64_mingw]
end

group :development, :test, :herokutest do
  gem 'rspec-rails', '3.1.0'

  gem 'factory_girl_rails', '4.5.0'

  gem 'database_cleaner', '1.4.1'

  # github version contains a monkey patch for pretty printing response body in API docs
  gem 'rspec_api_documentation', '4.3.0', git: "https://github.com/ts-silvio/rspec_api_documentation.git" 

  gem 'shoulda-matchers', '2.8.0', require: false
end
