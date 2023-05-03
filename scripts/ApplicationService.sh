#!/bin/bash
cd /var/app/current

# Stop Application
echo 'Application Stopping...'
docker-compose down
docker container prune -f
echo 'Application Stopped...'

# Config Application
git pull
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
echo 'Create Rails Master Key File...'
master_key=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_MASTER_KEY')
echo $master_key > config/master.key
echo 'Log in Docker Hub...'
dockerhub_user=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.DOCKERHUB_USER')
dockerhub_pass=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.DOCKERHUB_PASS')
docker login --username $dockerhub_user --password $dockerhub_pass
echo 'Docker Hub logged...'
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
echo 'Docker Building container'
docker-compose build $app_env
echo 'Docker Builded...'
echo 'Running Bundle...'
docker-compose run $app_env bundle
echo 'Bundle finished...'
echo 'DB migrating...'
docker-compose run $app_env rails db:migrate
echo 'DB migrated...'
echo 'Compiling Assets...'
docker-compose run $app_env rails assets:precompile
echo 'Assets Compiled...'

# Start Application
echo 'Restarting Application...'
docker-compose down
docker container prune -f
docker-compose up $app_env
echo 'Application Down...'