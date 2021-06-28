#!/usr/bin/env node
const { runCommands } = require("./runCommands");

runCommands([
  'git fetch',
  'git checkout master',
  'git pull origin master',
  'git --no-pager log --oneline --decorate --graph --all -n 12',
])

