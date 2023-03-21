#!/bin/bash
docker login --username lbneves --password redes002@
docker-compose down
docker container prune -f