#!/bin/bash
set -eu

projectdir=$(dirname "$0")/..
cd "$projectdir"

## This wrapper is needed because the e2e test scaffolding breaks on 0.12

npm run test:unit

v=$(node --version)
if [ "$v" != "v8" ]
then
    echo "Skipping browser testing for this version of node."
    exit 0
fi

npm install
npm run test:sauce
