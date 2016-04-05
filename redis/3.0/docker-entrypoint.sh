#!/bin/bash
set -e

if [ "$1" = 'redis-server' ]; then
    gosu redis "$@"
else
    exec "$@"
fi
