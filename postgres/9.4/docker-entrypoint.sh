#!/bin/bash
set -e

if [ "$1" = 'postgres' ]; then
    if [ -z "$(ls -A "$PGDATA")" ]; then
        gosu postgres initdb
        
        # applying default configuration
        gosu postgres cp /etc/pgsql/$PG_MAJOR/pg_hba.conf $PGDATA
        gosu postgres cp /etc/pgsql/$PG_MAJOR/postgresql.conf $PGDATA
        
        if [ "$POSTGRES_PASSWORD" ]; then
            # using password based authentication
            pass="PASSWORD '$POSTGRES_PASSWORD'"
            authMethod=md5
        else
            # any other container can access to postgres instance
            pass=
            authMethod=trust
        fi
        
        : ${POSTGRES_USER:=postgres}
        : ${POSTGRES_DB:=$POSTGRES_USER}

        if [ "$POSTGRES_DB" != 'postgres' ]; then
            gosu postgres postgres --single -jE <<-EOSQL
                CREATE DATABASE "$POSTGRES_DB" ;
EOSQL
            echo
        fi
        
        if [ "$POSTGRES_USER" = 'postgres' ]; then
            op='ALTER'
        else
            op='CREATE'
        fi

        gosu postgres postgres --single -jE <<-EOSQL
            $op USER "$POSTGRES_USER" WITH SUPERUSER $pass ;
EOSQL
        echo
        
        { echo; echo "host all all 0.0.0.0/0 $authMethod"; } >> "$PGDATA"/pg_hba.conf
        
    fi

    # starting postgres service
    exec gosu postgres "$@" 
else
    exec "$@"
fi
