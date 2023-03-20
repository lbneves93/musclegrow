#!/bin/bash
docker login --username lbneves --password redes002@
cd /var/app/current
docker-compose build $(printenv RAILS_ENV)
docker-compose run $(printenv RAILS_ENV) rails db:migrate
docker-compose run $(printenv RAILS_ENV) rails assets:precompile


