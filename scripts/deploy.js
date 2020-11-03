#!/usr/bin/env node
const { exec } = require(`child_process`)
const runCommands = commands => {
    const ls = exec(commands.join(` && `))
    ls.stdout.on(`data`,data => { process.stdout.write(`${data}`) })
    ls.stderr.on(`data`,data => { process.stdout.write(`${data}`) })
}

runCommands([`firebase deploy --only functions:${process.argv[2]}`])

