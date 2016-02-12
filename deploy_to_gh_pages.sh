#!/bin/bash

set -o pipefail
(
  set -e
  set -x

  GH_REPO=$(git config --get remote.origin.url)

  mkdir deploy_to_gh_pages
  cd deploy_to_gh_pages

  git init

  git config user.name "Travis-CI"
  git config user.email "travis@travis"

  npm run swagger bundle -- --json -o deploy_to_gh_pages/swagger.json
  npm run swagger bundle -- --yaml -o deploy_to_gh_pages/swagger.yaml

  git add .
  git commit -m "Deployed to Github Pages"

  GH_URL=$(echo "$GH_REPO" | sed "s#://#&${GH_TOKEN}@#")
  git push --force "$GH_URL" master:gh-pages 2>&1
) 2>&1 | sed "s/${GH_TOKEN}/xxPASSxx/"
