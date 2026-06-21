#!/usr/bin/env sh
set -eu

if [ "${APP_IMAGE:-}" = "" ]; then
  echo "Set APP_IMAGE first, for example: APP_IMAGE=cr.yandex/<registry_id>/web-app:latest" >&2
  exit 1
fi

if [ "${DB_HOST:-}" = "" ]; then
  echo "Set DB_HOST first. Use terraform output -raw mysql_host to get it." >&2
  exit 1
fi

if [ "${DB_PASSWORD:-}" = "" ]; then
  echo "Set DB_PASSWORD first." >&2
  exit 1
fi

export DB_PORT="${DB_PORT:-3306}"
export DB_USER="${DB_USER:-app}"
export DB_NAME="${DB_NAME:-virtd}"

docker compose -f compose.cloud.yaml pull web
docker compose -f compose.cloud.yaml up -d
