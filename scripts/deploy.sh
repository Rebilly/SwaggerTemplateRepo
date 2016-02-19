#!/bin/bash

set -e
set -x

cp -R portal portal_deploy

cd portal_deploy
bower install
cd -

npm run swagger bundle --        -o portal_deploy/swagger.json
npm run swagger bundle -- --yaml -o portal_deploy/swagger.yaml

