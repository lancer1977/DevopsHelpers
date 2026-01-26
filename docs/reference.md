# Reference

## Scripts

### `scripts/portainer/redeploy.sh`
**Required env vars**
- `PORTAINER_WEBHOOK_URL`

### `scripts/docker/build_push.sh`
**Required env vars**
- `IMAGE_NAME`

**Optional env vars**
- `DOCKERFILE_PATH` (default: `Dockerfile`)
- `CONTEXT_PATH` (default: `.`)
- `IMAGE_TAG` (default: `latest`)

### `scripts/dotnet/dotnet_build_test.sh`
**Optional env vars**
- `DOTNET_SOLUTION` (default: `.`)
- `DOTNET_CONFIGURATION` (default: `Release`)

## Azure Pipeline templates

### `templates/azure-pipelines/steps/portainer-webhook.yml`
Parameters:
- `webhookVar` (default: `PORTAINER_WEBHOOK_URL`) — pipeline variable name used to populate env

### `templates/azure-pipelines/jobs/docker-build-push-and-portainer-redeploy.yml`
Parameters:
- `imageName`, `dockerfilePath`, `contextPath`, `portainerWebhookVar`
