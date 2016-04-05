FROM centos:centos7
MAINTAINER Emanuele Palazzetti <hello@palazzetti.me>

# setting locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# put here all common operations
RUN curl -o /bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.5/gosu-amd64" && \
    chmod +x /bin/gosu && \
    yum install -y tar && \
    yum clean all
