#!/usr/bin/env node
const { exec } = require(`child_process`)

const run = async (command)=>{
  return new Promise((resolve,reject)=>{
    let output = ''
    const p = exec(command)
    p.stdout.on(`data`,data => { 
      output += data
      process.stdout.write(`${data}`)
     })
    // p.stderr.on(`data`,data => { 
    //   console.log(`THIS IS THE ERROR:`)
    //   console.log(data)
    //   console.log(`THIS WAS THE ERROR!`)
    //   process.stdout.write(`${data}`) 
    //   reject(data)
    // })
    p.on('data',d=>output+=d)
    p.on('error',d=>reject(d))
    p.on('exit',()=>resolve(output))
  })

}

exports.runCommands = async (commands)=>{
  try{
    for(command of commands){
      await run(command)
    }
  }catch(err){
    console.log(err)
  }
}

