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

RUN yum clean all

VOLUME  ["/opt"]

RUN mkdir /assets
WORKDIR /assets
ADD ./docker-entrypoint.sh /assets/
ADD ./Procfile /assets/
ADD ./nginx.static.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# Set the default command to run when starting the container
RUN chmod a+x /assets/docker-entrypoint.sh
ENTRYPOINT ["/assets/docker-entrypoint.sh"]

CMD ["start"]
