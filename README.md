# docker-airbyte

Airbyte with an Nginx reverse proxy

## Overview
This grabs the latest docker-compose.yaml and .env files from [airbytehq/airbyte](https://github.com/airbytehq/airbyte) and creates a backend network in place of the default exposed ports. A seperate Nginx reverse proxy is ran to access Airbyte.
## Use

Clone this repo on a machine and run:
```sh
# Linux
cd airbyte
./update-airbyte.sh
docker-compose up
```
```ps1
# Windows
cd airbyte
.\update-airbyte.ps1
docker-compose up
```

Set a login (see below) and optionally configure Nginx.

Open a new shell and run:
```sh
cd nginx
docker-compose up
```

## Create a login

Run a httpd container
``` sh
docker run -it --entrypoint /bin/bash --name make-htpasswd httpd
```

Create login

``` sh
htpasswd -c .htpasswd admin
```

`exit` container

Copy login to  folder
```
docker cp make-htpasswd:/usr/local/apache2/.htpasswd nginx/config/.htpasswd
```

Remove container (optional)
```sh
docker container rm make-htpasswd
```