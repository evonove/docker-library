# Evonove Kibana

This is a plain Kibana, so the provided config look for Elasticsearch in localhost, so you have to fix this.

You can just run it but you HAVE to provide a proper config file. You can create a kibana config file in the host and map it to /opt/kibana/config, for instance:

```
docker run -d \
 --name="kibana" \
  -p 5601:5601 \
 --link elasticsearch:<ES host referenced in the config file> \
 -v /etc/localtime:/etc/localtime:ro \
-v <path to config>:/opt/kibana/config \
 evonove/kibana:v1
```

**--name="kibana"** - name your container

**-p 5601:5601** - make port 5601 accessible from the host (you will access kibana at http://localhost:5601 then)

**--link elasticsearch:<ES host referenced in the config file>** - link an Elasticsearch container

**-v /etc/localtime:/etc/localtime:ro** - sync the time of the container with your host

**-v <path to config>:/opt/kibana/config** - map the path to the config file


