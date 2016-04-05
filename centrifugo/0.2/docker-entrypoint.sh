#! /bin/bash
set -e

if [ "$1" = 'centrifugo' ]; then
    gosu centrifugo $@
else
    exec "$@"
fi
