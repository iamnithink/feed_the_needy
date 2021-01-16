#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo 'performing db:migrate'
/app/bin/rails db:migrate
echo 'completed db:migrate'

echo 'performing assets:precompile'
/app/bin/rails assets:precompile
echo 'completed assets:precompile'

puma -C config/docker_puma.rb -p 8080
