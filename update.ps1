cd source
docker build -t update-airbytecompose .
docker run --name update-airbytecompose update-airbytecompose

cd ..
# rm .env
# rm docker-compose.yaml
docker cp update-airbytecompose:/app/output/. airbyte

docker container rm update-airbytecompose
docker image rm update-airbytecompose