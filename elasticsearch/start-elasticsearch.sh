#!/bin/bash
 
# Exit immediately if a command exits with a non-zero status.
set -e

chown elk:elk /opt/elasticsearch/logs
chown elk:elk /opt/elasticsearch/data 
exec gosu elk elasticsearch 

