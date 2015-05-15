source 'https://rubygems.org'

ruby '2.1.4'

gem 'rails', '4.2.1'

gem 'rails-api'

gem 'pg'

# Authentication (to use ActiveModel has_secure_password)
gem 'bcrypt'

# Authorization
gem "pundit"

# JSON
gem 'jbuilder'
gem 'oj'
gem 'oj_mimic_json'

# for heroku
gem 'unicorn'
gem 'rails_12factor', group: :production

# third party services
gem 'cloudinary'
gem 'airbrake'

group :development do
  gem 'spring'

  gem 'pry-rails'

  gem "rails-erd"

  gem "railroady"

  gem "rails_best_practices"

  gem "rubocop"

  gem "rubocop-rspec"
end

group :development, :test do
  gem 'pry-byebug'

  gem 'spring-commands-rspec'

  gem 'guard-rspec'

  gem 'rb-fsevent'

  gem 'bullet'

  gem 'vcr'

  gem 'webmock'
end

group :development, :test, :herokutest do
  gem 'rspec-rails', '~> 3.1.0'

  gem 'factory_girl_rails'

  gem 'database_cleaner'

  # github version contains a monkey patch for pretty printing response body in API docs
  gem 'rspec_api_documentation', git: "https://github.com/ts-silvio/rspec_api_documentation.git"

  gem 'shoulda-matchers', require: false
end
