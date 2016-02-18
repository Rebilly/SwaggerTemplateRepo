#!/bin/bash

set -e
set -x

mkdir deploy_to_gh_pages

npm run swagger bundle --        -o deploy_to_gh_pages/swagger.json
npm run swagger bundle -- --yaml -o deploy_to_gh_pages/swagger.yaml

