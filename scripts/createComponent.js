const fs = require(`fs`)
const path = require(`path`)
const { camelCase,pascalCase } = require(`change-case`)
const { exec } = require(`child_process`)

const componentsDir = path.join(process.cwd(),`src`,`components`)
if(!fs.existsSync(componentsDir)) {
  console.log(`Can't find components directory`)
  process.exit()
}

const filename = camelCase(process.argv[2]) + `.js`
const componentName = pascalCase(process.argv[2])
const filepath = path.join(componentsDir,filename)
const contents = 
`import React from "react"
import styled from "styled-components"

const ${componentName} = () => {
  return (
    <Container>
      hello
    </Container>
  )
}

export default ${componentName} 

const Container = styled.div\`
  display:flex;
\`

`

fs.writeFileSync(filepath,contents)

exec(`code -r ${filepath}`)
