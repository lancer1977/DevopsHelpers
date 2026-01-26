# Secret Handling

## Rule: no secrets in this repo
No webhook tokens, no PATs, no registry passwords, no internal-only URLs you wouldn’t want public.

## Azure DevOps
- Put secrets in **Variable Groups** (Library)
- Mark values secret
- Reference via `variables: - group: ...`
- Pass into templates as env vars

## GitHub Actions
- Store secrets in **Settings → Secrets and variables**
- Prefer **Environments** for dev/stage/prod separation
- Use `secrets.*` and never echo them
