## How to set up Rails dev env

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
