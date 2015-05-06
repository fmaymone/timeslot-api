## Silvio's Guardfile

```bash
# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rsspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separetly)
#  * 'just' rspec: 'rspec'
guard :rspec, cmd: "RAILS_ENV=localtest foreman run spring rspec" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$}) do |m|
    ["spec/#{m[1]}_spec.rb",
     "spec/requests/v1/#{m[1]}_spec.rb"]
  end

  watch(%r{^app/models/(.+)\.rb$}) do |m|
    ["spec/#{m[1]}_spec.rb",
     "spec/requests/v1/#{m[1]}s_spec.rb"]
  end

  watch(%r{^app/models/(.+)slot\.rb$}) do |m|
    ["spec/#{m[1]}_spec.rb",
     "spec/requests/v1/slots_spec.rb",
     "spec/acceptance/v1/slots_spec.rb"]
  end

  watch(%r{^app/views/v(.+)/(.*)/(.+)\.jbuilder$}) do |m|
    ["spec/#{m[1]}_spec.rb",
     "spec/controllers/v#{m[1]}/#{m[2]}_controller_spec.rb",
     "spec/requests/v#{m[1]}/#{m[2]}_spec.rb",
     "spec/acceptance/#{m[2]}_spec.rb"]
  end

  watch(%r{^app/policies/(.+)_policy.rb$}) do |m|
    ["spec/#{m[1]}_spec.rb",
     "spec/controllers/v1/#{m[1]}s_controller_spec.rb",
     "spec/requests/v1/#{m[1]}s_spec.rb",
     "spec/acceptance/#{m[1]}s_spec.rb"]
  end

  watch(%r{^app/controllers/v(.+)/(.+)_(controller)\.rb$}) do |m|
    # p m
    # p "spec/#{m[3]}s/#{m[1]}/#{m[2]}_#{m[3]}_spec.rb",
    ["spec/routing/v#{m[1]}/#{m[2]}_routing_spec.rb",
     "spec/requests/v#{m[1]}/#{m[2]}_spec.rb",
     "spec/#{m[3]}s/v#{m[1]}/#{m[2]}_#{m[3]}_spec.rb",
     "spec/acceptance/#{m[2]}_spec.rb"]
  end

  # application_controller
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/requests/#{m[1]}_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb"]
  end

  watch(%r{^app/controllers/application_controller.rb$}) do |m|
    ["spec/requests/v1/users_spec.rb",
     "spec/acceptance/users_spec.rb"]
  end

  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  watch('spec/rails_helper.rb')                       { "spec" }


  # Acceptance Specs
  watch(%r{^spec/acceptance/(.+)\.rb$})
end
```
