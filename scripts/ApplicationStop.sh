#!/bin/bash
cd /var/app/current
docker-compose down
docker container prune -f