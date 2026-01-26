# Using this toolkit from GitHub Actions

The trick: checkout your app repo *and* checkout this toolkit repo into a folder.

## Example
See: `examples/github-actions/build-and-redeploy.yml`

Key points:
- `PORTAINER_WEBHOOK_URL` should be stored in `secrets`
- Docker registry auth should use `docker/login-action` or secrets
- Scripts here are portable: they read env vars and run
