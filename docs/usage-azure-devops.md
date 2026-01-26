# Using this toolkit from Azure DevOps Pipelines

## Option A: Toolkit hosted in Azure DevOps Repos
```yaml
resources:
  repositories:
    - repository: toolkit
      type: git
      name: YourProject/devops-toolkit
      ref: refs/tags/v1.0.0

variables:
- group: Portainer-Prod  # contains PORTAINER_WEBHOOK_URL as a secret

jobs:
- template: templates/azure-pipelines/jobs/docker-build-push-and-portainer-redeploy.yml@toolkit
  parameters:
    imageName: docker.io/lancer1977/api-documents
    dockerfilePath: WebApi/Dockerfile
    contextPath: WebApi
    portainerWebhookVar: PORTAINER_WEBHOOK_URL
```

## Option B: Toolkit hosted in GitHub
Requires an Azure DevOps **service connection** to GitHub.
```yaml
resources:
  repositories:
    - repository: toolkit
      type: github
      name: YourGitHubOrg/devops-toolkit
      ref: refs/tags/v1.0.0
      endpoint: github-connection

variables:
- group: Portainer-Prod

jobs:
- template: templates/azure-pipelines/jobs/docker-build-push-and-portainer-redeploy.yml@toolkit
  parameters:
    imageName: docker.io/lancer1977/api-documents
    dockerfilePath: WebApi/Dockerfile
    contextPath: WebApi
```

## Where to put “moving” values (Portainer URL changes)
Put them **upstream**:
- Azure DevOps Variable Group: `PORTAINER_WEBHOOK_URL`
- Or better: your stable forwarder URL: `https://deploy.polyhydragames.com/portainer/<service>`
