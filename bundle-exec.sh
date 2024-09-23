#!/bin/bash

# Add a local gemfile in case there is none yet.
# See: https://blog.widefix.com/personal-gemfile-for-development/

# Run the bundle exec rails commands with a different database for each git branch.
GIT_BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`
SILENCE_DEPRECATIONS=1 MYSQL_DATABASE=$GIT_BRANCH_NAME MYSQL_DATABASE_TEST=${GIT_BRANCH_NAME}_test bundle exec "$@"
