#!/bin/bash

# Trigger an error if non-zero exit code is encountered
set -e

bundle exec rake db:create db:migrate
exec rails server -b 0.0.0.0
