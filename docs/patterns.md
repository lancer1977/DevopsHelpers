# Patterns (How this toolkit is meant to be used)

## 1) Templates contain *logic wiring*, scripts contain *logic execution*
- Templates pass parameters → environment variables
- Scripts read environment variables → perform work

This makes the same scripts usable in Azure DevOps, GitHub Actions, or locally.

## 2) Keep environment-specific values upstream
Examples:
- Portainer webhook URL/token
- Registry credentials
- Hostnames, internal URLs
- Deployment targets

**Where to store them:**
- Azure DevOps: Variable Groups + secrets, or Library
- GitHub: Environments + Secrets

## 3) Stable “forwarder” endpoints for moving targets (Portainer, etc.)
Instead of pipelines calling Portainer directly, create a stable deploy URL:

`https://deploy.polyhydragames.com/portainer/<service>` → forwards to Portainer webhook

Then pipelines only know the deploy URL and never store the webhook token.

See: `docs/portainer-forwarder.md`

## 4) Version pinning
Always consume templates via a **tag**:
- `ref: refs/tags/v1.0.0`

This prevents surprise changes across dozens of repos.

## 5) Contracts > convenience
For each template/script define:
- Required env vars
- Optional env vars + defaults
- Outputs (if any)
- Failure behavior + retries

See: each script header and `docs/reference.md`.
