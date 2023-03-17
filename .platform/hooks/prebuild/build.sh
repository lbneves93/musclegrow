#!/bin/bash
set -e
echo > ../deploy.log
echo Starting Pre build... >> ../deploy.log
echo Environment: $(printenv RAILS_ENV) >> ../deploy.log
echo Migrating Database... >> ../deploy.log
docker-compose run --rm web rails db:migrate RAILS_ENV=$(printenv RAILS_ENV)
echo Compile Assets... >> ../deploy.log
docker-compose run --rm web rails assets:precompile
echo Build finished with success! >> ../deploy.log
echo Stopping containers after build.. >> ../deploy.log
docker stop $(docker ps -aq)
echo Removing containers after build.. >> ../deploy.log
docker container prune -f

