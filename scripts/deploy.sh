#!/bin/bash

set -e
set -x

cp -R web web_deploy

cd web_deploy
bower install
cd -

npm run swagger bundle --        -o web_deploy/swagger.json
npm run swagger bundle -- --yaml -o web_deploy/swagger.yaml

