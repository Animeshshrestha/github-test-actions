#!/bin/sh
# This is bash program to display Hello World
docker-compose -f production.yml down
docker-compose -f production.yml build
docker-compose -f production.yml up -d
docker-compose -f production.yml run --rm web python manage.py migrate
docker-compose -f production.yml run --rm web python manage.py collectstatic --noinput
docker update --restart unless-stopped $(docker ps -q)