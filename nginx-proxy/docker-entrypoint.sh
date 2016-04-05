#! /bin/bash

set -e

if [ "$1" = 'start' ]; then

  mkdir -p /opt/log/nginx
  mkdir -p /opt/static

  # Start forego
  forego start -r
fi

exec "$@"
