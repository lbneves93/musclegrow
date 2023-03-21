#!/bin/bash
docker login --username lbneves --password redes002@
cd /var/app/current
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
echo > ../deploy.log
echo Starting After Install... >> ../deploy.log
echo Environment: $app_env >> ../deploy.log
echo Building Container... >> ../deploy.log
docker-compose build $app_env
echo Migrating Database... >> ../deploy.log
docker-compose run $app_env rails db:migrate
echo Precompile Assets... >> ../deploy.log
docker-compose run $app_env rails assets:precompile


