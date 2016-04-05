# Evonove Logstash

This is a plain Logstash, so no config is provided.

You can just run it to let it work, but you HAVE to provide a config file. You can create a logstash config file in the host and map it to /opt/logstash/config, for instance:

```
docker run -d \
 --name="logstash" \
  -p 5000:5000 \
  -p 5000:5000/udp \
 --link elasticsearch:elasticsearch_host \
 -v /etc/localtime:/etc/localtime:ro \
 -v <path to config>:/opt/logstash/config \
 evonove/logstash:v1
```

**--name="logstash"** - name your container

**-p 5000:5000** - make port 5000 accessible from the host (tcp and udp)

**--link elasticsearch:<ES host referenced in the config file>** - link an Elasticsearch container

**-v /etc/localtime:/etc/localtime:ro** - sync the time of the container with your host

**-v <path to config>:/opt/logstash/config** - map the path to the config file


