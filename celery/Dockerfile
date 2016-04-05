FROM python:3.4
MAINTAINER Evonove info@evonove.it

# install forego
RUN curl -o /usr/local/bin/forego https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego
RUN chmod u+x /usr/local/bin/forego

# install docker-gen
RUN curl -OL https://github.com/jwilder/docker-gen/releases/download/0.3.4/docker-gen-linux-amd64-0.3.4.tar.gz
RUN tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-0.3.4.tar.gz

# install celery & flower monitor
RUN pip install celery flower virtualenv

RUN mkdir /assets
WORKDIR /assets
ADD . /assets

ENV DOCKER_HOST unix:///tmp/docker.sock
# let root run celery daemon
ENV C_FORCE_ROOT 1

# Set the default command to run when starting the container
RUN chmod a+x /assets/docker-entrypoint.sh
ENTRYPOINT ["/assets/docker-entrypoint.sh"]
