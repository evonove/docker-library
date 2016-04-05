#
# Kibana 4.1.1 image
#
 
FROM evonove/scratch

MAINTAINER Luca Truffarelli <luca@truffarelli.it>

ENV KIBANA_VERSION 4.1.1
 
ENV KIBANA_HOME /opt/kibana
 
WORKDIR /opt
 
# Create the elk user and elk system group.
RUN groupadd -r elk && useradd -r -g elk elk

# Install required software
RUN yum install -y wget hostname && yum clean all
 
# Copy the script used to launch when a container is started.
COPY ./start-kibana.sh /opt/
 
# Download 
RUN wget https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz  && \

# Create directories.
    mkdir ${KIBANA_HOME} && \

# Extract 
    tar -xzf kibana*.tar.gz  -C ${KIBANA_HOME} --strip-components=1 && \

# Remove archives.
    rm *.tar.gz && \

# Set owner of Kibana directory 
    chown -hR elk:elk ${KIBANA_HOME} && \

# Make the start-script executable.
    chmod +x /opt/start-kibana.sh 

# Kibana UI port, Elasticsearch REST API/Kopf port and Logstash.
EXPOSE 5601 
 
# Add Elasticsearch, Logstash and Kibana bin directories to path.
ENV PATH ${KIBANA_HOME}/bin:$PATH
 
# Launch the ELK stack when a container is started.
CMD ["/opt/start-kibana.sh"]

