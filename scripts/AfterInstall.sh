#!/bin/bash
dockerhub_user=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.DOCKERHUB_USER')
dockerhub_pass=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.DOCKERHUB_PASS')
docker login --username $dockerhub_user --password $dockerhub_pass
cd /var/app/current
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
docker-compose build $app_env
docker-compose run $app_env rails db:migrate
docker-compose run $app_env rails assets:precompile


