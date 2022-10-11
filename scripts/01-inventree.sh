#!/bin/bash

# DigitalOcean Marketplace Image Validation Tool
# © 2021 DigitalOcean LLC.
# This code is licensed under Apache 2.0 license (see LICENSE.md for details)

# Setup postgres
sudo service postgresql start
sudo -u postgres psql -c "create database inventree;"
sudo -u postgres psql -c "create user inventree with encrypted password 'inventree_password';"
sudo -u postgres psql -c "grant all privileges on database inventree to inventree;"

# Set env variables for postgres
export INVENTREE_DB_ENGINE="postgresql"
export INVENTREE_DB_NAME="inventree"
export INVENTREE_DB_USER="inventree"
export INVENTREE_DB_PASSWORD="inventree_password"
export INVENTREE_DB_HOST="localhost"
export INVENTREE_DB_PORT="5432"
export SETUP_EXTRA_PIP="psycopg2 pgcli"

# Install InvenTree
curl https://raw.githubusercontent.com/matmair/InvenTree/deploy-test/contrib/install.sh | sudo sh
