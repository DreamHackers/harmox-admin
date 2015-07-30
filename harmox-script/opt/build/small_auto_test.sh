!#/bin/sh

# caution: stgでテストして下さい

git clone --depth=50 --branch=master git://github.com/pollseed/harmox-app.git
cd pollseed/
git fetch
git checkout master
git pull origin master

cd ./harmox-admin
bundle install --without development --deployment
RAILS_ENV=test bundle exec rake db:drop
RAILS_ENV=test bundle exec rake db:create
bundle exec rake db:test:prepare
bundle exec rspec spec/
