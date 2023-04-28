#!/bin/bash
cd /var/app/current
echo > ../musclegrow-service.log
# Stop Application
echo 'Application Stopping... Time:' $(date) >> ../musclegrow-service.log
docker-compose down
docker container prune -f
echo 'Application Stopped... Time:' $(date) >> ../musclegrow-service.log

# Config Application
git pull
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
echo 'Create Rails Master Key File... Time:' $(date) >> ../musclegrow-service.log
master_key=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_MASTER_KEY')
echo $master_key > config/master.key
echo 'Log in Docker Hub... Time:' $(date) >> ../musclegrow-service.log
dockerhub_user=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.DOCKERHUB_USER')
dockerhub_pass=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.DOCKERHUB_PASS')
docker login --username $dockerhub_user --password $dockerhub_pass
echo 'Docker Hub logged... Time:' $(date) >> ../musclegrow-service.log
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
echo 'Docker Building container... Time:' $(date) >> ../musclegrow-service.log
docker-compose build $app_env
echo 'Docker Builded... Time:' $(date) >> ../musclegrow-service.log
echo 'Running Bundle... Time:' $(date) >> ../musclegrow-service.log
docker-compose run $app_env bundle
echo 'Bundle finished... Time:' $(date) >> ../musclegrow-service.log
echo 'DB migrating... Time:' $(date) >> ../musclegrow-service.log
docker-compose run $app_env rails db:migrate
echo 'DB migrated... Time:' $(date) >> ../musclegrow-service.log
echo 'Compiling Assets... Time:' $(date) >> ../musclegrow-service.log
docker-compose run $app_env rails assets:precompile
echo 'Assets Compiled... Time:' $(date) >> ../musclegrow-service.log

echo 'Restarting Application... Time:' $(date) >> ../musclegrow-service.log
docker-compose down
docker container prune -f
docker-compose up -d $app_env
echo 'Application Up... Time:' $(date) >> ../musclegrow-service.log