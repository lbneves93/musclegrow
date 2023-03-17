#!/bin/bash
set -e
echo Starting Post deploy... >> ../deploy.log
docker stop $(docker ps -aq)
docker container prune -f
echo Start Rails in application in deamon mode! >> ../deploy.log
echo Environment: $(printenv RAILS_ENV) >> ../deploy.log
docker-compose up -d $(printenv RAILS_ENV)
echo Rails application running! >> ../deploy.log