#!/bin/bash
cd /var/app/current
echo > ../deploy.log
echo Log in Docker Hub... >> ../deploy.log
docker login --username lbneves --password redes002@
echo Stopping all containers... >> ../deploy.log
docker-compose down
echo Removing all containers... >> ../deploy.log
docker container prune -f