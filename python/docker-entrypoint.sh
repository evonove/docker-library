#! /bin/bash

set -e

VENV_DIR_PATH=/assets/libs

# create virtualenv if doesn't exist
if [ ! -d $VENV_DIR_PATH/bin ]; then
  virtualenv --system-site-packages $VENV_DIR_PATH
fi

# activate virtualenv
. $VENV_DIR_PATH/bin/activate

# Start forego or execute a command in the virtualenv
if [ "$#" -eq 0 ]; then
  # install or update requirements
  pip install -r $REQUIREMENTS_FILE

  forego start -r
else
  "$@"
fi
