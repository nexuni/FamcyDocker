# Docker for Famcy
This is the docker for Famcy deploy. It is separated into three deployment scheme:

	1. Flask + Gunicorn (for development and quick deploy, can also be integrated into existing nginx settings)
	2. Flask + Gunicorn + Nginx (for internal use / http production deploy)
	3. Flask + Gunicorn + Nginx + Certbot (for global use / https production deploy)

## Prerequisite
1. [Install Docker Engine](https://docs.docker.com/engine/install/)
2. [Install Docker Compose](https://docs.docker.com/compose/install/)

## Quick Start

1. Clone the repo
2. Create ```.env``` file within the same level of the docker-compose files
3. Set the following environment variables:
```	
FAMCY_SRC_FOLDER={YOUR FAMCY SRC LOCATION}
```
4. ```Tips on volume mapping``` If you want to link your volumes into famcy static folders, you can add another volume mapping in the docker-compose.yml file. An example is shown below:
```
...
    container_name: famcy
    volumes:
      - ${FAMCY_SRC_FOLDER}:/app/.local/share/famcy/dev/console
      - {THE FOLDER ON YOUR HOST THAT YOU WANT TO LINK}:/app/.local/share/famcy/dev/console/_static_/image/lpr_data
    ports:
      - "8888:8888"
...
```

## Flask + Gunicorn
This is for development and quick deploy, can also be integrated into existing nginx settings.

Run
```
docker-compose up -d
```

If you want to restart or shut it down, use the following commands:
```
docker-compose restart
docker-compose down -v
```

## Flask + Gunicorn + Nginx
This is for internal use and http production deploy.

Run
```
docker-compose -f docker-compose.http.prod.yml up --build
```

If you want to restart or shut it down, use the following commands:
```
docker-compose -f docker-compose.http.prod.yml restart
docker-compose -f docker-compose.http.prod.yml down -v
```

## Flask + Gunicorn + Nginx + Certbot
This is for global use and https production deploy.

Run
```
docker-compose -f docker-compose.https.prod.yml up --build
```

If you want to restart or shut it down, use the following commands:
```
docker-compose -f docker-compose.https.prod.yml restart
docker-compose -f docker-compose.https.prod.yml down -v
```