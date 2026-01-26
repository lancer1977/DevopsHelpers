# DevOps Toolkit (Starter)

A **Swiss‑army knife** repo of **CI templates + scripts** designed to work with:

- **Azure DevOps Pipelines** (YAML templates)
- **GitHub Actions** (reusing the same scripts)
- Any runner that can execute Bash

## Goals

- **Reusable building blocks** (steps/jobs/stages)
- **Portable scripts** that read config from environment variables
- **No secrets in this repo** (ever)
- **Versionable** via tags like `v1.0.0`

## Quick start

### Azure DevOps (templates repo as a resource)
See: [`docs/usage-azure-devops.md`](docs/usage-azure-devops.md)

### GitHub Actions (checkout this repo as a second repo)
See: [`docs/usage-github-actions.md`](docs/usage-github-actions.md)

## Repo layout

```
templates/
  azure-pipelines/
    steps/   # small reusable building blocks
    jobs/    # composed jobs
    stages/  # composed stages (optional)
scripts/
  docker/
  dotnet/
  portainer/
examples/
  azure-devops/
  github-actions/
docs/
```

## License
MIT — see [`LICENSE`](LICENSE).
