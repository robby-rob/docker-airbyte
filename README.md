# docker-airbyte

Airbyte with an Nginx reverse proxy for user login.

## Overview
Airbyte does not currently have user authentication.

This grabs the latest docker-compose from [airbytehq/airbyte](https://github.com/airbytehq/airbyte) and replaces the default exposed ports with a backend network. An Nginx reverse proxy is then used to provide Airbyte with a user login for authentication.

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
