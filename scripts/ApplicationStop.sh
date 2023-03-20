#!/bin/bash
docker login --username lbneves --password redes002@
docker stop $(docker ps -aq)
docker docker container prune -f