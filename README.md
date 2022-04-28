# docker-airbyte

Airbyte with an Nginx reverse proxy

## Overview
This grabs the latest docker-compose.yaml and .env files from [airbytehq/airbyte](https://github.com/airbytehq/airbyte) and adds an Nginx reverse proxy to the docker-compose file.
## Use

Clone this repo on a machine and run the update script:
```sh
# Linux
./update.sh
```
```ps
# Windows
.\update.ps1
```

Then navigate to the airbyte directory and run:
```sh
docker-compose up
```