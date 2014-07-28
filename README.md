# TS RAILS BACKEND

## Set up Rails dev env

* Install homebrew:
```bash
$ ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
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
brew install rbenv
brew install ruby-build
brew install rbenv-gem-rehash
```
* add to end of .bashrc / .zshrc:
```bash
eval "$(rbenv init -)"
export PATH=bin:$PATH
```
* install ruby 2.1.0
```bash
rbenv install 2.1.0
```

* install bundler:
```bash
gem install bundler
```
* install gems:
```bash
bundle install
```

## Postgres database creation

* install postgresql
```bash
brew install postgresql	
```
* create local user and when prompt for password enter "9dh39fd"
```bash
createuser -P -d ts_rails_backend
```
* initialization database
```bash
bundle exec rake db:create
```

## Starting rails

* Start dev server (s=server,u=debugger)

```bash
bundle exec rails s -u
```

## Additional software you may want to use

* [Cocoa Rest Client](http://mmattozzi.github.io/cocoa-rest-client/)
* [PGCommander](https://eggerapps.at/pgcommander/)
