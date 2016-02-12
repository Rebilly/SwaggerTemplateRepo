#!/bin/bash

#FIXME:
GH_TOKEN=1234

set -o pipefail
(
  set -e
  set -x

  mkdir deploy_to_gh_pages

  git config user.name "Travis-CI"
  git config user.email "travis@travis"

  npm run swagger bundle --json -o deploy_to_gh_pages/swagger.json
  npm run swagger bundle --yaml -o deploy_to_gh_pages/swagger.json

  cd deploy_to_gh_pages
  git add .
  git commit -m "Deployed to Github Pages"


  echo '=================================='
  git config --get remote.origin.url
  echo '=================================='
  #git push --force "https://${GH_TOKEN}@${GH_REF}" master:gh-pages 2>&1
) 2>&1 | sed "s/${GH_TOKEN}/xxPASSxx/"
