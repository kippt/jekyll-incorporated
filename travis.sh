#!/bin/bash

if [[ $TRAVIS_BRANCH == 'staging' ]]
then
  bundle exec rake site:staging
elif [[ $TRAVIS_BRANCH == 'master' ]]
then
  bundle exec rake site:publish
else
  echo "Nothing to do here."
fi
