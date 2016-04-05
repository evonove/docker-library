#
# Elasticsearch 1.7.1 image
#
 
FROM evonove/java8

MAINTAINER Luca Truffarelli <luca@truffarelli.it>

ENV ELASTICSEARCH_VERSION 1.7.1
 
ENV ELASTICSEARCH_HOME /opt/elasticsearch
 
WORKDIR /opt
 
# Create the elk user and elk system group.
RUN groupadd -r elk && useradd -r -g elk elk

# Install required software
RUN yum install -y wget hostname && yum clean all
 
# Copy the script used to launch when a container is started.
COPY ./start-elasticsearch.sh /opt/
 
# Download 
RUN wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz && \

# Create directories.
    mkdir ${ELASTICSEARCH_HOME} && \

# Extract 
    tar -xzf elasticsearch*.tar.gz  -C ${ELASTICSEARCH_HOME} --strip-components=1 && \

# Remove archives.
    rm *.tar.gz && \

# Create needed dires
    mkdir ${ELASTICSEARCH_HOME}/logs && \
    mkdir ${ELASTICSEARCH_HOME}/data && \

# Set owner of Elasticsearch directory so that data directory can be created.
    chown -hR elk:elk ${ELASTICSEARCH_HOME} && \

# Install Elasticsearch kopf plug-in: https://github.com/lmenezes/elasticsearch-kopf
    gosu elk ${ELASTICSEARCH_HOME}/bin/plugin -install lmenezes/elasticsearch-kopf && \

# Make the start-script executable.
    chmod +x /opt/start-elasticsearch.sh

# Ports
EXPOSE 9200 
 
# Add bin directories to path.
ENV PATH ${ELASTICSEARCH_HOME}/bin:$PATH

# Launch the ELK stack when a container is started.
CMD ["/opt/start-elasticsearch.sh"]

