#!/usr/bin/env bash
set -euo pipefail

: "${PORTAINER_WEBHOOK_URL:?PORTAINER_WEBHOOK_URL is required}"

echo "Triggering Portainer webhook..."
curl -fsS -X POST "${PORTAINER_WEBHOOK_URL}" >/dev/null
echo "Portainer webhook triggered."
