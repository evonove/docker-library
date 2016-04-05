FROM evonove/scratch
MAINTAINER Emanuele Palazzetti <hello@palazzetti.me>

ENV DOCKER_GEN_VERSION 0.4.0
ENV FOREGO_DOWNLOAD https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego 
ENV DOCKER_GEN_DOWNLOAD https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

# installing nginx
RUN yum localinstall -y http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
    yum install -y openssl && \
    yum install -y --disablerepo="*" --enablerepo=nginx nginx && \
    yum clean all

# configuring nginx applying a fix for very long server names
RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    sed -i 's/^http {/&\n    server_names_hash_bucket_size 128;/g' /etc/nginx/nginx.conf

# providing forego
RUN curl -sSL "$FOREGO_DOWNLOAD" -o /usr/local/bin/forego
RUN chmod u+x /usr/local/bin/forego

# providing docker-gen
RUN curl -sSL "$DOCKER_GEN_DOWNLOAD" -o docker-gen.tar.gz && \
    tar -C /usr/local/bin -xvzf docker-gen.tar.gz && \
    rm -f docker-gen.tar.gz

VOLUME ["/opt"]
VOLUME ["/etc/nginx/certs"]
VOLUME ["/etc/nginx/conf.d"]

RUN mkdir /assets
WORKDIR /assets
ADD . /assets

# Set the default command to run when starting the container
RUN chmod a+x /assets/docker-entrypoint.sh
ENTRYPOINT ["/assets/docker-entrypoint.sh"]

EXPOSE 80
ENV DOCKER_HOST unix:///tmp/docker.sock
CMD ["start"]
