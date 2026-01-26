---
created: 2026-01-25
tags: [devops, templates, ci, azure-devops, github-actions]
---

# DevOps Toolkit

A shared repo of CI templates + scripts to standardize builds.

## Principles
- No secrets in repo
- Everything configurable via env vars / pipeline variables
- Version with tags
- Stable forwarder URLs for moving infra targets (Portainer)

## Next additions
- Health-check step after deploy
- Retry/backoff in redeploy script
- Optional Slack/Discord notification steps
