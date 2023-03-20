#!/bin/bash
cd /var/app/current
docker-compose up -d $(printenv RAILS_ENV)
