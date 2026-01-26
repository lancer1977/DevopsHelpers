#!/usr/bin/env bash
set -euo pipefail

: "${IMAGE_NAME:?IMAGE_NAME is required}"
: "${DOCKERFILE_PATH:=Dockerfile}"
: "${CONTEXT_PATH:=.}"
: "${IMAGE_TAG:=latest}"

echo "Building ${IMAGE_NAME}:${IMAGE_TAG}"
docker build -f "${DOCKERFILE_PATH}" -t "${IMAGE_NAME}:${IMAGE_TAG}" "${CONTEXT_PATH}"

echo "Pushing ${IMAGE_NAME}:${IMAGE_TAG}"
docker push "${IMAGE_NAME}:${IMAGE_TAG}"
