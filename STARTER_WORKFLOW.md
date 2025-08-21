# Create starter workflow
1. Create repo .github
2. Create folder name workflow-templates
3. metada file how workflow present 
4. Need to have a organization for the workflows
5. If not have org then you need to create organization
6. create file workflow-templates/your-workflow.yml
7. Add the necessary workflow configuration in your-workflow.yml
```yml
name: demo starter workflow

on:
  push:
    branches:
      - [$default-branch]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '14'

      - name: Install dependencies
        run: npm install

      - name: Run build
        run: npm run build
```

8. create metadata file in new file workflow-templates/metadata-file.yml

```yml
{
  "name": "demo starter workflow",
  "description": "A starter workflow for demo purposes",
  # Add icon svg file
  "iconName": "raghibnadim",
  "categories": [
    "demo",
    "starter"
  ]
}
```
9. in New repo create - > go to action -> slow sample workflow which you created
10. get the setting of org to setting -> action -> runner open
11. go to runner group -> allow runner to public repo also
