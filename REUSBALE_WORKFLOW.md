1. Create reusable workflow `reusable-deployment.yaml`

2. Create a workflow which calls the reusable workflow `reusable-deployment.yaml`

3. Pass secret from caller workflow to called workflow
- In caller workflow:
```yaml
uses: ./.github/workflows/reusable-workflow.yaml
secrets:
    k8s-kubeconfig: ${{ secrets.k8s-kubeconfig }}
    mongodb-password: ${{ secrets.mongodb-password }}
```
- In called workflow:
```yaml
on:
  workflow_call:
    secrets:
      k8s-kubeconfig:
        required: true
      mongodb-password:
        required: true
```

4. Limitation of reusable workflow, env variables are not directly accessible.
- Create repo level variables in github repo in setting -> variables -> actions
- add in resuable workflowe as inputs
```yml
inputs:
    mongodb-uri:
    required: true
    type: string
    description: The MongoDB connection URI
```
- add with in caller workflow
```yaml
with:
    mongodb-uri: ${{ vars.mongodb-uri }}
```


5. output keyword from reusable workflow to caller workflow
- In reusable workflow:
```yaml
workflow_call:
    outputs:
        value: ${{ jobs.reusable-workflow.outputs.value }}
        matrix-json: ${{ steps.build.outputs.matrix-json }}
        matrix-count: ${{ steps.build.outputs.matrix-count }}
        account_id: ${{ steps.build.outputs.account_id }}
        account_name: ${{ steps.build.outputs.account_name }}
        bucket_name: ${{ steps.build.outputs.bucket_name }}
```
- In caller workflow:
```yaml
jobs:
  generate-matrix:
    uses: ./.github/workflows/reusable-workflow.yaml
    with:
      mongodb-uri: ${{ vars.mongodb-uri }}
    outputs:
      application_url: ${{ steps.generate-matrix.outputs.ingress_uri }}
```
- in caller workflow
```yml
steps:
  - name: Set up environment variables
    env:
      URL: ${{ needs.dev-deploy.outputs.application_url }}
    run: |
      echo "$URL" >> "$GITHUB_OUTPUT"
```