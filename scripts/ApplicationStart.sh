#!/bin/bash
cd /var/app/current
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
echo 'Restarting Application... Time:' $(date) >> ../deploy.log
docker-compose down
docker container prune -f
docker-compose up -d $app_env
echo 'Application Up... Time:' $(date) >> ../deploy.log
