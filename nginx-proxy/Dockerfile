FROM centos:centos7
MAINTAINER Evonove info@evonove.it

# Configure repos
RUN yum localinstall -y http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

# Install Nginx.
RUN yum install openssl -y
RUN yum install --disablerepo="*" --enablerepo=nginx install nginx -y

# We need tar
RUN yum --disablerepo="*" --enablerepo=base install tar -y

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

#fix for long server names
# TODO ex: server_names_hash_bucket_size 64;
# RUN sed -i 's/# server_names_hash_bucket/server_names_hash_bucket/g' /etc/nginx/nginx.conf

RUN curl -o /usr/local/bin/forego https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego
RUN chmod u+x /usr/local/bin/forego

RUN curl -OL https://github.com/jwilder/docker-gen/releases/download/0.3.3/docker-gen-linux-amd64-0.3.3.tar.gz
RUN tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-0.3.3.tar.gz

RUN yum clean all

RUN mkdir -p /opt/log/nginx
RUN mkdir -p /opt/static
WORKDIR /opt
ADD . /opt

EXPOSE 80
ENV DOCKER_HOST unix:///tmp/docker.sock

CMD ["forego", "start", "-r"]