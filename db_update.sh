#!/bin/bash

set -e

echo -e "\n📥 Stahuji změny z Gitu..."
git pull origin main

echo -e "\n🚀 Spouštím migrace přes Flyway..."
docker compose run --rm flyway migrate

echo -e "\n✅ Migrace dokončena!"
