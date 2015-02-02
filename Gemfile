source 'https://rubygems.org'

ruby '2.1.4'

gem 'rails', '4.1.4'

gem 'rails-api'

gem 'pg'

# To use ActiveModel has_secure_password
gem 'bcrypt'

gem "pundit"

# To use Jbuilder templates for JSON
gem 'jbuilder'

gem 'oj'

gem 'oj_mimic_json'

# Use unicorn as the app server
gem 'unicorn'

gem 'rails_12factor', group: :production

gem 'cloudinary'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

group :development do
  gem 'spring'

  gem 'pry-rails'

  gem "rails-erd"

  gem "railroady"
end

group :development, :test do
  gem 'pry-byebug'

  gem 'spring-commands-rspec'

  gem 'guard-rspec'

  gem 'rb-fsevent'

  gem 'faker'

  gem 'bullet'

  gem 'vcr'

  gem 'webmock'
end

group :development, :test, :herokutest do
  gem 'rspec-rails', '~> 3.0.0'

  gem 'factory_girl_rails'

  gem 'database_cleaner'

  gem 'rspec_api_documentation'

  gem 'shoulda-matchers', require: false
end
