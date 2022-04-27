#!/sh
mkdir output

wget https://raw.githubusercontent.com/airbytehq/airbyte/master/.env
wget https://raw.githubusercontent.com/airbytehq/airbyte/master/docker-compose.yaml

cp .env /app/output/.env

# Backend
cat docker-compose.yaml | \
yq 'del(.services.*.ports)' | \
yq '.services.*.networks.[0] = "backend"' | \
cat > docker-compose.yaml

# Frontend
yq eval-all 'select(fileIndex == 0) *+ select(fileIndex == 1)' docker-compose.yaml /app/reverseproxy.yaml | \
cat > /app/output/docker-compose.yaml
