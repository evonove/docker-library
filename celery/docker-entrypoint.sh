#! /bin/bash

set -e

VENV_DIR_PATH=/assets/libs

if [ "$1" = 'run' ]; then
    # create virtualenv if doesn't exist
    if [ ! -d $VENV_DIR_PATH/bin ]; then
        virtualenv --system-site-packages $VENV_DIR_PATH
    fi
    # activate virtualenv
    . $VENV_DIR_PATH/bin/activate
    # install requirements
    pip install -r $REQUIREMENTS_FILE
    # generate Procfile
    docker-gen -config docker-gen.cfg
    # Start forego
    forego start -r
fi

exec "$@"
