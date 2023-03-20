#!/bin/bash
docker login --username lbneves --password redes002@
cd /var/app/current
echo > ../deploy.log
echo Starting After Install... >> ../deploy.log
echo Environment: $(printenv RAILS_ENV) >> ../deploy.log
echo Building Container... >> ../deploy.log
docker-compose build $(printenv RAILS_ENV)
echo Migrating Database... >> ../deploy.log
docker-compose run $(printenv RAILS_ENV) rails db:migrate
echo Precompile Assets... >> ../deploy.log
docker-compose run $(printenv RAILS_ENV) rails assets:precompile


