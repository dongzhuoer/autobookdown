#!/bin/bash
# trigger deploy stage on this repo

time=`date '+%Y-%m-%d %H:%M:%S'`
body="{
   \"request\": {
        \"message\": \"only deploy because build $TRAVIS_REPO_SLUG on $time\",
        \"branch\": \"master\"
    }
}"
curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -H "Travis-API-Version: 3" \
    -H "Authorization: token $TRAVIS_TOKEN" \
    -d "$body" \
    https://api.travis-ci.com/repo/dongzhuoer%2Fautobookdown/requests