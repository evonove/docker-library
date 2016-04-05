FROM ubuntu:14.10
MAINTAINER Evonove info@evonove.it

# Update system libraries
RUN apt-get update && apt-get upgrade -y

# Build requirements
RUN apt-get install -y build-essential git curl

# Environment variables
ENV NODE_VERSION 0.12.0
ENV NODE_PATH /usr/local/lib/node_modules/
ENV NPM_VERSION 2.7.3

# Frontend toolchain
RUN apt-get install -y ruby ruby-dev
RUN gem install compass

RUN gpg --keyserver pgp.mit.edu --recv-keys 114F43EE0176B71C7BC219DD50A3051F888C628D

RUN curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
  && curl -SLO "http://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --verify SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-x64.tar.gz\$" SHASUMS256.txt.asc | sha256sum -c - \
  && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.gz" SHASUMS256.txt.asc \
  && npm install -g npm@"$NPM_VERSION"

RUN npm install -g coffee-script gulp bower

# Clean everything
RUN npm config set tmp /root/.tmp && npm cache clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/* && npm cache clear

VOLUME  ["/opt/build"]
WORKDIR /opt/build

# Set the default command to run when starting the container
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
