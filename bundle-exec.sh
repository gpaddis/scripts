#!/bin/bash

# Run the bundle exec rails commands with a different database for each git branch.
GIT_BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`
SILENCE_DEPRECATIONS=1 MYSQL_DATABASE=$GIT_BRANCH_NAME MYSQL_DATABASE_TEST=${GIT_BRANCH_NAME}_test bundle exec "$@"
