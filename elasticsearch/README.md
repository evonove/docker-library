# Evonove Elasticsearch

This is a plain Elasticsearch, so no config is provided.

You can just run it to let it work, but you might want to provide at least some params to make it more useful. For instance

```
docker run -d \
 --name="elasticsearch" \
 -p 9200:9200 \
 -v /etc/localtime:/etc/localtime:ro \
 --volumes-from "es-data"
 evonove/elasticsearch:latest
```

**--name="elasticsearch"** - name your container

**-p 9200:9200** - make port 9200 accessible from the host (usefull to run curl commands)

**-v /etc/localtime:/etc/localtime:ro** - sync the time of the container with your host

**--volumes-from "es-data"** - use an external data volume container to persist data
Create an external data volume container for instance this way:

```
docker create -v /opt/elasticsearch/logs -v /opt/elasticsearch/data --name "es-data" evonove/scratch /bin/true
```

