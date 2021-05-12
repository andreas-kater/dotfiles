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

const gcmp = async ()=>{
  try{
    await run(`git add .`)
    await run(`git commit -m "${process.argv[2]}"`)
    await run(`git push`)
    await run(`git --no-pager log --oneline --decorate --graph --all -n 12`)
  }catch(err){
    await run('say "commit failed"')
    console.log(err)
  }
}

gcmp()
