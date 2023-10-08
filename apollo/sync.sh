#!/usr/bin/env bash

# get current script's dir
SCRIPT_DIR=$(dirname "$0")

# download yaml file
wget https://raw.githubusercontent.com/apolloconfig/apollo-quick-start/master/docker-compose-arm64.yml -O "$SCRIPT_DIR/docker-compose-arm64.yml"
wget https://raw.githubusercontent.com/apolloconfig/apollo-quick-start/master/docker-compose.yml -O "$SCRIPT_DIR/docker-compose.yml"
wget https://raw.githubusercontent.com/apolloconfig/apollo-quick-start/master/sql/apolloconfigdb.sql -O "$SCRIPT_DIR/sql/apolloconfigdb.sql"
wget https://raw.githubusercontent.com/apolloconfig/apollo-quick-start/master/sql/apolloportaldb.sql -O "$SCRIPT_DIR/sql/apolloportaldb.sql"