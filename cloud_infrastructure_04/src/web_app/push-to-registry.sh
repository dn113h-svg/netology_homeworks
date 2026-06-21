#!/usr/bin/env sh
set -eu

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
TF_DIR="${SCRIPT_DIR}/.."

YC_REGISTRY_ID="${YC_REGISTRY_ID:-${1:-}}"

if [ "${YC_REGISTRY_ID}" = "" ] && command -v terraform >/dev/null 2>&1; then
  YC_REGISTRY_ID="$(terraform -chdir="${TF_DIR}" output -raw container_registry_id 2>/dev/null || true)"
fi

if [ "${YC_REGISTRY_ID}" = "" ]; then
  echo "Set YC_REGISTRY_ID first, pass it as an argument, or run terraform apply before this script." >&2
  echo "Examples:" >&2
  echo "  YC_REGISTRY_ID=crp... sh push-to-registry.sh" >&2
  echo "  sh push-to-registry.sh crp..." >&2
  exit 1
fi

IMAGE_TAG="${IMAGE_TAG:-latest}"
APP_IMAGE="cr.yandex/${YC_REGISTRY_ID}/web-app:${IMAGE_TAG}"
LOCAL_IMAGE="web-app:${IMAGE_TAG}"

docker build -t "${LOCAL_IMAGE}" "${SCRIPT_DIR}"
docker tag "${LOCAL_IMAGE}" "${APP_IMAGE}"
docker push "${APP_IMAGE}"

echo "Pushed ${APP_IMAGE}"
