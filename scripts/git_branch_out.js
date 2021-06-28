#!/usr/bin/env node
const { runCommands } = require("./runCommands");

runCommands([
  'git fetch',
  'git checkout master',
  'git pull origin master',
  `git checkout -b ${process.argv[2]}`,
  'git --no-pager log --oneline --decorate --graph --all -n 12',
])