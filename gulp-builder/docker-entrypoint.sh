#! /bin/bash

set -e

if [ "$1" = 'shell' ]; then
    exec "/bin/bash"
else
    npm install && bower install --allow-root --config.interactive=false
    gulp "$@"
fi
