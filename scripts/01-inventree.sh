#!/bin/bash

# DigitalOcean Marketplace Image Validation Tool
# © 2021 DigitalOcean LLC.
# This code is licensed under Apache 2.0 license (see LICENSE.md for details)

# user and folder setup
sudo useradd -m -d /home/inventree -s /bin/bash inventree
sudo su inventree
cd /home/inventree
mkdir log data

# get source
git clone https://github.com/inventree/inventree src
cd src
git checkout tags/0.5.4
cd /home/inventree

# setup postgres
sudo service postgresql start
sudo -u postgres psql -c "create database inventree;"
sudo -u postgres psql -c "create user inventree with encrypted password 'inventree_password';"
sudo -u postgres psql -c "grant all privileges on database inventree to inventree;"

# python setup
python3 -m venv env
source ./env/bin/activate

pip install wheel
pip install -U -r src/requirements.txt
pip3 install psycopg2 pgcli

# copy default config
sudo cp /var/inventree_default/config.yaml /home/inventree/src/InvenTree/config.yaml

# run init
cd /home/inventree/src
invoke update

# nginx
rm -rvf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/inventree.conf \
      /etc/nginx/sites-enabled/inventree.conf
rm -rf /var/www/html/*
chown -R www-data: /var/www
