#!/bin/bash

if [[ $TRAVIS_BRANCH == 'staging' ]]
then
  bundle exec rake site:staging
  echo "Deploying to staging: http://spark.github.io/staging-blog"
elif [[ $TRAVIS_BRANCH == 'master' ]]
then
  bundle exec rake site:publish
  echo "Deploying to blog.spark.io"
else
  echo "Nothing to do here!"
fi
