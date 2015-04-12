# TS RAILS BACKEND

## Set up Rails dev env

* Install homebrew:
```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* Add to end of .bashrc / .zshrc:
```bash
export PATH=/usr/local/bin:$PATH
```

* uninstall rvm:
```bash
rvm implode
```

* install rbenv:
```bash
brew update
brew install rbenv ruby-build rbenv-gem-rehash
```

* add to end of .bash_profile / .zshrc:
```bash
eval "$(rbenv init -)"
export PATH=bin:$PATH
```

* install ruby 2.1.4
```bash
rbenv install 2.1.4
rbenv local 2.1.4 # inside the project folder or set ruby version globally
```

* install bundler and postgresql
```bash
gem install bundler postgresql
```

* install application gems:
```bash
bundle install
```

## Postgres database creation

* create local user and when prompt for password enter "9dh39fd"
```bash
createuser -P -d ts_rails_backend
```
* initialization database and run migrations
```bash
bundle exec rake db:create
rake db:migrate
```


# Notes

## No delete & destroy

**Delete** and **Destroy** are globally disabled in ```config/activerecord_extensions.rb```,
instead we use a db-column called **deleted_at** or set a specific state on the model.
## Authorization

Authorization is done via a token in the http header which is compared to a locally saved token for every user. The token is invalidated on logout and regenerated on login.
On first signup the token is also created so a signed up user is already logged in.

## Authentication

We use Pundit for Authentication. In the ```app/policies/``` folder are all files which contain authentication logic.


# External Services

Using them usually requires setting some environment variables.
This can be done via .env of with [another approach](http://stackoverflow.com/a/11765775/531439).
The following env variables are expected:

## Cloudinary

Cloud Service for our Media Data.
[Docs](http://cloudinary.com/)

```bash
ENV['TS_RAILS_BACKEND_CLOUDINARY_CLOUD_NAME']
ENV['TS_RAILS_BACKEND_CLOUDINARY_API_KEY']
ENV['TS_RAILS_BACKEND_CLOUDINARY_API_SECRET']
```
On Heroku the configuration is handled by the cloudinary addon.

## Location DB

The Data Team provides a database based on OSM Location Data. This DB is transparently available for the backend. At the moment we use a ssh tunnel for connecting.


```
ENV['LOCATION_DB_URI'] # postgres uri of locations production db
```

## Search Service

The Data Team provides an elasticSearch - Location Search Interface for it's location data

```bash
ENV['TS_LOCATION_SEARCH_SERVICE_NAME'] # username
ENV['TS_LOCATION_SEARCH_SERVICE_PASSWORD'] # password
ENV['TS_LOCATION_SEARCH_SERVICE_URL'] # search url
```

## Airbrake

via Heroku Addon
[Docs](https://airbrake.io/)
[Github](https://github.com/airbrake/airbrake)

## Papertrail

via Heroku Addon
[Docs](https://papertrailapp.com/)
[Heroku Docs](https://devcenter.heroku.com/articles/papertrail)

## Other

```bash
ENV['ENABLE_IOS_DB_CLEAN'] = 'true' # to enable the endpoint for db cleaning
ENV['TS_SLOT_WEBSHARING_URL'] = 'http://timesl.ot/' # domain name for the slot websharing service app, given we have one
```


# More Tools

## Webserver

* Start default rails dev server (s=server)

```bash
rails s
```

or use foreman:

```bash
gem install foreman
foreman start
```

## Specs / Tests

If you're having issues with the TEST_ENV Database after a migration had run
(for me the postgres specific types always get changed), destroy your TEST_ENV
database and re-run all migrations: ```RAILS_ENV=test rake db:migrate:reset```

### Flags

Beside the ```:focus``` flag, which let only flagged specs run a ```:db``` flag can be used to print the database interactions of the specific spec to the console.

### [Database Cleaner Gem](https://github.com/DatabaseCleaner/database_cleaner)

Manages database transactions for specs/tests.
Default strategy is ```transaction```.
If a spec needs ```truncation```, a **:commit** flag can be set on the test.

```
describe "auditing", :commit do
# spec goes here
end
```

### [VCR](https://github.com/vcr/vcr)

The specs use the vcr gem (and webmock), which records external requests on the first run and on previous runs always returns this response. This makes that specs faster and allows them to be run offline, but also hides if there had been changes in the external API which breaks the comunication.

### [Bullet](https://github.com/flyerhzm/bullet)

Detects n+1 database queries.

### Guard

To run specs automatically if a file was edited.
At the end of this document is my somewhat messy Guardfile with some customizations.

## Debugger / REPL

* [pry](http://pryrepl.org/screencasts.html)
* [pry-rails](https://github.com/rweng/pry-rails)
* [byebug](https://github.com/deivid-rodriguez/byebug)
* [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)

## API Documentation

The documentation is based on the *spec/acceptance* tests.
The DSL is outlined [here](https://github.com/zipmark/rspec_api_documentation#dsl).

### Generating API documentation

* This is done via gem [rspec_api_documentation](https://github.com/zipmark/rspec_api_documentation). Call:
```
rake docs:generate
```

Per default the documentation is generated as **markdown**.
The generated Markdown files will be in *doc/api* folder.

## Entity-Relationship Diagrams

Can be automatically created in two flavours, both with their up- and downsides:

* install graphviz with pango/cairo support.
```bash
brew install Caskroom/cask/xquartz
brew install graphviz --with-pangocairo
```
* gen simple ERD
```bash
bin/rake generate_lean_erd
```

* gen detailed ERD
```bash
bin/rake generate_adv_erd
```

## Git & JIRA

[Project's Agile Jira Work Board](https://timeslot.atlassian.net/projects/BKD/summary)

At the moment we use a mix of the GitFlow Workflow and the Forking Workflow.

* [Comparing Workflows - Atlassian](https://www.atlassian.com/git/tutorials/comparing-workflows)
* [GitFlow Explained](http://datasift.github.io/gitflow/IntroducingGitFlow.html)
* [GitFlow Tutorial](http://www.effectivetrainings.de/blog/2012/04/22/git-flow-einfaches-arbeiten-mit-dem-perfekten-git-workflow/) (german)

```
brew install git git-flow-avh
```

### Git Commit Commands for JIRA

* When commiting use the following commit message format:

`ACTION KEY #resolved <comment>`

* e.g. `git commit -m "ADD TRB-2 including module to stretch lifetime"`

* **KEY** is the Jira Issue Number
* **ACTION** should be one of **ADD**ition, **DEL**etion, **MOD**ification, **IMP**rovement, **FIX** for small bugfixes, **WIP** if you need to commit while work in progress, **WTF** in special cases...
* More detailed information on JIRA smart commit messages [here](https://confluence.atlassian.com/display/AOD/Processing+JIRA+issues+with+commit+messages)

However, this is likely to change sooner or later... The JIRA-Github integration is not yet done.

## Coding Conventions / Styleguide

* If patching third party libraries we use a **ts_** prefix.
* The API Responses are in lowerCamelCase, the transformation from snake_case is automatically handled by jbuilder gem
* [rubocop](https://github.com/bbatsov/rubocop)
* [rails best practices](https://github.com/railsbp/rails_best_practices)

```
gem install rubocop rubocop-rspec rails_best_practices
```

## Additional software you may want to use

#### JSON Tools

* [Cocoa Rest Client](http://mmattozzi.github.io/cocoa-rest-client/)
* [Postman](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm) - addon for google chrome

#### Database Tools

* [PGCommander](https://eggerapps.at/pgcommander/)
* [Navicat Essentials for POSTGRESQL](https://itunes.apple.com/de/app/navicat-essentials-for-postgresql/id466725643?l=en&mt=12)
* [PGAdmin](http://www.pgadmin.org/download/macosx.php) - not so fancy but free

#### Markdown viewers/editors for Mac

* [Marked 2](http://marked2app.com/)
* [Mou](http://25.io/mou/)


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
