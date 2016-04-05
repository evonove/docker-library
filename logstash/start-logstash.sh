#!/bin/bash
 
# Exit immediately if a command exits with a non-zero status.
set -e
 
exec gosu elk logstash  -f /opt/logstash/config/

