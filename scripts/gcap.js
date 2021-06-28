#!/usr/bin/env node
const { runCommands } = require("./runCommands");

runCommands([
  'git add .',
  'git commit --amend --no-edit',
  'git push -f',
  'git --no-pager log --oneline --decorate --graph --all -n 12',
])