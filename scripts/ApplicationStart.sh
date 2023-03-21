#!/bin/bash
cd /var/app/current
app_env=$(/opt/elasticbeanstalk/bin/get-config environment | jq -r '.RAILS_ENV')
docker-compose up -d $app_env
