#!/bin/bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color (resetování barvy)

superset db upgrade

if [[ "$SUPERSET_ADMIN_PASSWORD" == "admin" ]]; then
  echo -e "${YELLOW}WARNING: SUPERSET_ADMIN_PASSWORD is set to default 'admin'.${NC}"
  
  while true; do
    read -p "Do you want to continue with the default 'admin' password? (y/n): " confirm
    case $confirm in
      [Yy]* ) 
        echo -e "${GREEN}Continuing with default password...${NC}"
        break;;
      [Nn]* ) 
        echo -e "${RED}Please set a secure password in your .env file or environment variables.${NC}"
        exit 1;;
      * ) 
        echo -e "${RED}Please answer 'y' or 'n'.${NC}"
    esac
  done
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