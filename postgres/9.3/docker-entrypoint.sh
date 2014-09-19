#! /bin/bash

set -e

export PGDATA="/etc/pgsql/9.3/"

PG_DATA_DIRECTORY="/var/lib/pgsql/9.3/data"
PG_BIN="/usr/pgsql-9.3/bin"

if [ "$1" = 'postgres' ]; then
  if [ -z "$(ls -A "$PG_DATA_DIRECTORY")" ]; then
    # Database initialization
    $PG_BIN/postgresql93-setup initdb

    # Create default user
    echo "Enter a valid database user:"
    read USER
    echo "Enter a valid database name:"
    read DB

    # Add user and database
    su postgres -c "$PG_BIN/postgres &"
    su postgres -c "$PG_BIN/createuser --interactive $USER -P"
    su postgres -c "$PG_BIN/createdb $DB -O $USER"
    kill -INT `head -1 $PG_DATA_DIRECTORY/postmaster.pid`
    sleep 2
  fi

  # Start postgres
  su postgres -c "$PG_BIN/postgres"
fi

exec "$@"
