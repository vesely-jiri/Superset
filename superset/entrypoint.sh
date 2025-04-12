#!/bin/bash
set -e

superset db upgrade

if [[ "$SUPERSET_ADMIN_PASSWORD" == "admin" ]]; then
  echo "WARNING: SUPERSET_ADMIN_PASSWORD is set to default 'admin'."
  read -p "Do you want to continue with the default 'admin' password? (y/n): " confirm
  if [[ "$confirm" != "y" ]]; then
    echo "Please set a secure password in your .env file or environment variables."
    exit 1
  fi
fi

echo "Creating Superset admin user: $SUPERSET_USER_ADMIN"

superset fab create-admin \
  --username "${SUPERSET_ADMIN_USER:-admin}" \
  --firstname Admin \
  --lastname Admin \
  --email "${SUPERSET_ADMIN_EMAIL:-admin@example.com}" \
  --password "${SUPERSET_ADMIN_PASSWORD:-admin}" || true

superset init

exec gunicorn -w 10 -b 0.0.0.0:8088 "superset.app:create_app()"