#!/bin/bash
cd /var/app/current
echo 'Create Rails Master Key File... Time:' $(date) >> ../deploy.log
master_key=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_MASTER_KEY')
echo $master_key > config/master.key
echo 'Log in Docker Hub... Time:' $(date) >> ../deploy.log
dockerhub_user=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.DOCKERHUB_USER')
dockerhub_pass=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.DOCKERHUB_PASS')
docker login --username $dockerhub_user --password $dockerhub_pass
echo 'Docker Hub logged... Time:' $(date) >> ../deploy.log
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
echo 'Docker Building container... Time:' $(date) >> ../deploy.log
docker-compose build $app_env
echo 'Docker Builded... Time:' $(date) >> ../deploy.log
echo 'Running Bundle... Time:' $(date) >> ../deploy.log
docker-compose run $app_env bundle
echo 'Bundle finished... Time:' $(date) >> ../deploy.log
echo 'DB migrating... Time:' $(date) >> ../deploy.log
docker-compose run $app_env rails db:migrate
echo 'DB migrated... Time:' $(date) >> ../deploy.log
echo 'Compiling Assets... Time:' $(date) >> ../deploy.log
docker-compose run $app_env rails assets:precompile
echo 'Assets Compiled... Time:' $(date) >> ../deploy.log


