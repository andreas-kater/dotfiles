#!/usr/bin/env node
const { runCommands } = require("./runCommands");

runCommands([
  'git push',
  'git pull-request -c',
])