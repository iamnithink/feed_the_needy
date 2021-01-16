#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

if [ "$RAILS_ENV" != "development" ]
then
  echo 'performing assets:precompile'
  /app/bin/bundle install
  echo 'completed assets:precompile'

  echo 'performing db:migrate'
  /app/bin/rails db:migrate
  echo 'completed db:migrate'

  echo 'performing assets:precompile'
  /app/bin/rake assets:precompile
  echo 'completed assets:precompile'
fi

bundle exec rails s -b 0.0.0.0 -e "$RAILS_ENV"
