source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.1'

gem 'rails-api', '0.4.0'

gem 'pg', '0.18.2'

# Authentication (to use ActiveModel has_secure_password)
gem 'bcrypt'

# Authorization
gem "pundit", '1.0.1'

# JSON
gem 'jbuilder', '2.3.0'
gem 'oj', '2.12.9'
gem 'oj_mimic_json', '1.0.1'

# for heroku
gem 'puma', platforms: :ruby # exclude installation on Windows
gem "rack-timeout"
gem 'rails_12factor', group: :production

# third party services
gem 'cloudinary'
gem 'airbrake'
gem 'aws-sdk'
gem 'newrelic_rpm'

# use pry also on heroku
gem 'pry-rails'

# Worker (background processing)
gem 'sucker_punch'

# GetStream.io
gem 'stream_rails'

# Redis Data Storage
gem 'redis'

# WebSockets
gem 'websocket-rails', '0.1.8'
gem 'faye-websocket'

# Adding CORS (Cross-Origin Resource Sharing)
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem "rails-erd"

  gem "railroady"

  gem "rails_best_practices"

  gem "rubocop"

  gem "rubocop-rspec"
end

group :development, :test do
  gem 'pry-byebug'

  gem 'pry-doc'

  gem 'spring'

  gem 'spring-commands-rspec'

  gem 'guard-rspec'

  gem 'guard-puma'

  gem 'terminal-notifier-guard'

  gem 'rb-fsevent'

  gem 'bullet'

  gem 'vcr'

  gem 'webmock'

  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
end

group :development, :test, :herokutest do
  gem 'rspec-rails'

  gem 'factory_girl_rails'

  gem 'database_cleaner'

  # github version contains a monkey patch for pretty printing response body in API docs
  gem 'rspec_api_documentation', git: "https://github.com/ts-silvio/rspec_api_documentation.git"

  gem 'shoulda-matchers', '~> 3.0'

  gem 'faker'
end
