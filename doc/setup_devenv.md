## Prerequisites Ubuntu


* Install some dependencies for Ruby:
```bash
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
```

* install rbenv:
```bash
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
```

* install postgresql

```bash
sudo apt-get install -y postgresql-9.3 postgresql-server-dev-9.3 postgresql-contrib-9.3 postgresql-client-9.3 postgresql-doc-9.3  libpq-dev
sudo su - postgres -c "psql -c \"ALTER USER postgres WITH PASSWORD 'JMDF83M2A';\""
echo "localhost:5432:*:postgres:JMDF83M2A" >> ~/.pgpass
chmod 0600 ~/.pgpass
```

## Prerequisites OSX

* uninstall rvm if installed:
```bash
rvm implode
```

* Install homebrew:
```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

* Add to end of .bashrc / .zshrc:
```bash
export PATH=/usr/local/bin:$PATH
```

* install rbenv and postgresql:
```bash
brew update
brew install rbenv ruby-build rbenv-gem-rehash
brew install postgresql
```

* add to end of .bash_profile / .zshrc:
```bash
eval "$(rbenv init -)"
export PATH=bin:$PATH
```


## Setup dev env

* install ruby:
```bash
rbenv install 2.1.6
rbenv global 2.1.6
ruby -v
```

* install bundler, don't install documentation for gems:
```bash
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
```

* install application gems:
```bash
bundle install
```


## Postgres database creation

* create local user on OSX (when prompt for password enter "9dh39fd")
```bash
createuser -P -d ts_rails_backend
```

* create local user on Linux
```bash
psql -h localhost -U postgres -c "CREATE ROLE ts_rails_backend WITH SUPERUSER LOGIN PASSWORD '9dh39fd'"
echo "localhost:5432:*:ts_rails_backend:9dh39fd" >> ~/.pgpass
```

* initialization database and run migrations
```bash
bundle exec rake db:create
rake db:migrate
```


## Start server

* prepare local server and test env

```bash
gem install foreman
foreman start
```


## Run tests

```bash
rake db:migrate RAILS_ENV=test
rspec
```
