#!/usr/bin/env node
'use strict';
require('shelljs/global');

set('-e');
set('-v');

var branch = process.env.TRAVIS_BRANCH && process.env.TRAVIS_BRANCH.toLowerCase();
if (branch && branch !== 'gh-pages') {
  mkdir('-p', '.tmp/branches/' + branch);
  exec('npm run swagger bundle -- -o .tmp/branches/' + branch + '/swagger.json');
  exec('deploy-to-gh-pages --update .tmp');
}
