#!/usr/bin/env bash
set -euo pipefail

: "${DOTNET_SOLUTION:=.}"
: "${DOTNET_CONFIGURATION:=Release}"

echo "dotnet restore ${DOTNET_SOLUTION}"
dotnet restore "${DOTNET_SOLUTION}"

echo "dotnet build ${DOTNET_SOLUTION} -c ${DOTNET_CONFIGURATION}"
dotnet build "${DOTNET_SOLUTION}" -c "${DOTNET_CONFIGURATION}" --no-restore

echo "dotnet test ${DOTNET_SOLUTION} -c ${DOTNET_CONFIGURATION}"
dotnet test "${DOTNET_SOLUTION}" -c "${DOTNET_CONFIGURATION}" --no-build
