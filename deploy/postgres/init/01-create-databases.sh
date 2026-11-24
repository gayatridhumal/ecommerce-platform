#!/bin/bash
set -e

for svc in customer inventory order payment shipping keycloak; do
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<EOSQL
CREATE USER ${svc}_user WITH PASSWORD '${SERVICE_DB_PASSWORD}';
CREATE DATABASE ${svc}_db OWNER ${svc}_user;
EOSQL
done