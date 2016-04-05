#
# Logstash 1.5.3 image
#
 
FROM evonove/java8

MAINTAINER Luca Truffarelli <luca@truffarelli.it>

ENV LOGSTASH_VERSION 1.5.3

ENV LOGSTASH_HOME /opt/logstash
 
WORKDIR /opt
 
# Create the elk user and elk system group.
RUN groupadd -r elk && useradd -r -g elk elk

# Install required software
RUN yum install -y wget hostname && yum clean all

# Copy the script used to launch when a container is started.
COPY ./start-logstash.sh /opt/
 
# Download
RUN wget https://download.elastic.co/logstash/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \

# Create directories.
    mkdir ${LOGSTASH_HOME} && \

# Extract
    tar -xzf logstash*.tar.gz  -C ${LOGSTASH_HOME} --strip-components=1 && \

# Remove archives.
    rm *.tar.gz && \

# Make config dir
    mkdir ${LOGSTASH_HOME}/config && \

# Set owner of Logstash directory so that data directory can be created.
    chown -hR elk:elk ${LOGSTASH_HOME} && \

# Make the start-script executable.
    chmod +x /opt/start-logstash.sh 

# Ports
EXPOSE 5000
 
# Add bin directories to path.
ENV PATH ${LOGSTASH_HOME}/bin:$PATH
 
# Launch the ELK stack when a container is started.
CMD ["/opt/start-logstash.sh"]

