#!/bin/bash

date=`date +%m-%d-%Y`

cd /home/ubuntu/home_automation

docker-compose stop homeassistant

aws s3 sync --exclude 'www/*' --exclude 'secrets.yml' --exclude 'home-assistant.log' --exclude 'custom_components/*'  homeassistant/ s3://hass-backup-pi/$date

docker-compose start homeassistant
