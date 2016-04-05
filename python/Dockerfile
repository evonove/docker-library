FROM python:3.4
MAINTAINER Evonove info@evonove.it

# install forego
RUN curl -o /usr/local/bin/forego https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego
RUN chmod u+x /usr/local/bin/forego

# install virtualenv
RUN pip install virtualenv

RUN mkdir /assets
WORKDIR /assets
ADD . /assets

# Set the default command to run when starting the container
RUN chmod a+x /assets/docker-entrypoint.sh
ENTRYPOINT ["/assets/docker-entrypoint.sh"]
