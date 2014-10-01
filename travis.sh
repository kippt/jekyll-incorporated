#!/bin/bash

if [[ $TRAVIS_BRANCH == 'staging' ]]
  bundle exec rake site:staging
elif [[ $TRAVIS_BRANCH == 'master' ]]
  bundle exec rake site:publish
fi
