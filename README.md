# TS RAILS BACKEND

* [CHANGELOG](CHANGELOG.md)
* [Api Endpoint Documentation](doc/api/v1/index.markdown)
* [Project's Agile Jira Work Board](https://timeslot.atlassian.net/projects/BKD/summary)
* [App-Specification](https://docs.google.com/a/timeslot.com/document/d/12MZDzthoK6RrKhuJKfERfI6xpvZi_DP6ri0VWbZmnPc/edit?usp=sharing) [old app spec](https://timeslotapi.hackpad.com/IfMfC58g3jd#Timeslot-APP) (Hackpad)
* [Entity Relationship Diagram](doc/erd_adv-3.6.15.pdf) [[2](doc/erd_adv.pdf)] [[3](doc/erd.pdf)]
* [How-To Setup Development Environment](doc/setup_devenv.md)
* [Links to Some Useful Extra Information](doc/useful_links.md)
* [Deployment Proccess](doc/deployment_process.md)

# Notes

## No delete & destroy

**Delete** and **Destroy** are globally disabled in ```config/activerecord_extensions.rb```,
instead we use a db-column called **deleted_at** or set a specific state on the model.
## Authorization

Authorization is done via a token in the http header which is compared to a locally saved token for every user. The token is invalidated on logout and regenerated on login.
On first signup the token is also created so a signed up user is already logged in.

## Authentication

We use Pundit for Authentication. In the ```app/policies/``` folder are all files which contain authentication logic.


# Environment Variables

```bash
ENV['MAX_THREADS'] # number of concurrent Puma Webserver threads, defaults to 5 if not set
ENV['NOTIFICATION_WORKERS'] # number of concurrent SuckerPunch Notification Workers, defaults to 10 if not set
ENV['DB_POOL'] # number of available database connections, defaults to MAX_THREADS or 5 if both are not set, BUT should be at least MAX_THREADS + NOTIFICATION_WORKERS
# maximum on heroku free plan is 20
```

# External Services

Using them usually requires setting some environment variables.
This can be done via .env of with [another approach](http://stackoverflow.com/a/11765775/531439).
The following env variables are expected:

## AWS

[Docs](http://docs.aws.amazon.com/sdkforruby/api/index.html)

```bash
ENV['AWS_ACCESS_KEY_ID']
ENV['AWS_SECRET_ACCESS_KEY']
ENV['AWS_REGION']
```

### We use the following services

* [AWS Simple Notification Service](http://aws.amazon.com/documentation/sns/)

```bash
ENV['AWS_PLATFORM_APPLICATION_IOS'] # aws arn endpoint (iOS)
```

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

Flag | Effect
-------------|------------------
```:focus``` | let only marked specs run
```:db``` | print the database interactions of the specific spec to the console
```:vcr``` | use vcr to mock external requests, see below
```:aws``` | use aws to mock external requests to AWS service, see below
```:async``` | use async to mock asynchronously requests through sucker punch workers, see below
```:seed``` | load database seeds
```:commit``` | persist data in database, see below

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

The specs use the vcr gem (and webmock), which records external requests on the
first run and on previous runs always returns this response. This makes that
specs faster and allows them to be run offline, but also hides if there had been
changes in the external API which breaks the comunication.

To enable outgoing http requests in specs (Rails test env)  edit the first line
in the ```spec/support/vcr_setup.rb``` file.

To enable outgoing http requests in the Rails Dev Env there is a setting in
the ```development.rb``` file:
```
WebMock.allow_net_connect!
```

### AWS

The specs use the AWS webmock, which simulate external requests to AWS services.
This allows to test in an special environment where the changes would not store live.

### [Sucker Punch] (https://github.com/brandonhilkert/sucker_punch)

The specs use a webmock to handle asynchronously tasks, which is internally handled by the sucker punch gem.
This allows to test worker threads inside rails specs.

### [Bullet](https://github.com/flyerhzm/bullet)

Detects n+1 database queries.

### Guard

To run specs automatically if a file was edited.
At the end of this document is my somewhat messy Guardfile with some customizations.

* [Example Guardfile](/doc/guardfile_silvio.md)

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

## Git

At the moment we use a mix of the GitFlow Workflow and the Forking Workflow.

* [Git Workflow Backend Developer](doc/git_workflow_developer.md)
* [Comparing Workflows - Atlassian](https://www.atlassian.com/git/tutorials/comparing-workflows)


## Git Flow Tool (not used at the moment)

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
* [RESTClient](https://addons.mozilla.org/en-US/firefox/addon/restclient/) - addon for firefox

#### Database Tools

* [PGCommander](https://eggerapps.at/pgcommander/)
* [Navicat Essentials for POSTGRESQL](https://itunes.apple.com/de/app/navicat-essentials-for-postgresql/id466725643?l=en&mt=12)
* [PGAdmin](http://www.pgadmin.org/download/macosx.php) - not so fancy but free

#### Markdown viewers/editors for Mac

* [Marked 2](http://marked2app.com/)
* [Mou](http://25.io/mou/)
