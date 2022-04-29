cd source
docker build -t update-airbyte .
docker run --name update-airbyte update-airbyte
cd ..
docker cp update-airbyte:/app/output/. .
docker container rm update-airbyte
docker image rm update-airbyte