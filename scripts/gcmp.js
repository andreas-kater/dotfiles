#!/usr/bin/env node
const { exec } = require(`child_process`)

// const runCommands = commands => {
//     const ls = exec(commands.join(` && `))
//     ls.stdout.on(`data`,data => { process.stdout.write(`${data}`) })
//     ls.stderr.on(`data`,data => { process.stdout.write(`${data}`) })
// }

// runCommands([
//   `git add .`,
//   `git commit -m ${process.argv[1]}`,
//   `git push`,
//   `git --no-pager log --oneline --decorate --graph --all -n 12`,
//   // `gh run watch -i1`,
//   `terminal-notifier -title 'Github' -message 'Done deploying'`
//   // `say 'done deploying'`,
// ])


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

    await new Promise(resolve=>setTimeout(()=>resolve(),3000))

    const gh_list = await run('gh run list -L1')
    if(gh_list){
      console.log(gh_list)
      const regex = /([0-9]{9})/g
      const match = regex.exec(gh_list)
      if(match){
        const run_id = match[1] 
        await run(`gh run watch ${run_id} -i3`)
      }
    }
    await run(`terminal-notifier -title 'Github' -message 'Done deploying'`)
    // await run(`say 'done deploying'`)
  }catch(err){
    await run('say "deploy failed"')
    console.log(err)
  }
}

gcmp()
