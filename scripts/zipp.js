'use strict'

const fs = require('fs')
const { execSync } = require('child_process')
let [target, password] = process.argv.slice(2)
let foldername
if (fs.lstatSync(target).isFile()) {
    let filename = target
    foldername = filename.split('.').slice(0, -1).join('.')
    fs.mkdirSync(foldername)
    fs.renameSync(filename, `${foldername}/${filename}`)
} else if (fs.lstatSync(target).isDirectory()) {
    foldername = target
}
let zip = execSync(`zip -er ${foldername} ${foldername} -P ${password}`)