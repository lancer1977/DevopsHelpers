# Versioning & Release Flow

## Recommended
- Work on branches
- Merge to `main`
- Tag releases: `v1.0.0`, `v1.0.1`, ...
- Update `CHANGELOG.md`

## Why tags matter
Consuming pipelines should pin to a tag so template changes don’t break builds.

### Azure DevOps pin example
```yaml
resources:
  repositories:
    - repository: toolkit
      type: github
      name: YourOrg/devops-toolkit
      ref: refs/tags/v1.0.0
      endpoint: github-connection
```
