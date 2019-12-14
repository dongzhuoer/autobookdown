#!/bin/bash

# Some Travis tasks, which build a bookdown book, use this script to trigger build of this repo
user=dongzhuoer; repo=bookdown.dongzhuoer.com; branch=master
curl -s -X POST \
    -H "Authorization:token $TRAVIS_TOKEN" \
    -H "Content-Type:application/json" \
    -H "Accept:application/json" \
    -H "Travis-API-Version:3" \
    -d "{ \"request\":{\"branch\":\"$branch\", \"message\":\"rebuilt $TRAVIS_REPO_SLUG\"} }"  \
    "https://api.travis-ci.com/repo/$user%2F$repo/requests"
    