#!/bin/bash
cd /var/app/current
echo > ../deploy.txt
echo 'Application Stopping... Time:' $(date) >> ../deploy.log
docker-compose down
docker container prune -f
echo 'Application Stopped... Time:' $(date) >> ../deploy.log