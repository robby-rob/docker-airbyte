#!/bin/sh

cd /tmp

wget https://raw.githubusercontent.com/airbytehq/airbyte/master/.env
wget https://raw.githubusercontent.com/airbytehq/airbyte/master/docker-compose.yaml

cp .env /app/output/.env

# Backend Network
cat docker-compose.yaml | \
yq 'del(.services.*.ports)' | \
yq '.services.*.networks.[0] = "backend"' | \
yq '.networks.backend.name = "airbyte-backend"' | \
cat > /app/output/docker-compose.yaml
