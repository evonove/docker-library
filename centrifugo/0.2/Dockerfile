FROM evonove/scratch
MAINTAINER Emanuele Palazzetti <hello@palazzetti.me>

ENV VERSION 0.2.1
ENV RELEASE 1435075106
ENV DOWNLOAD https://github.com/centrifugal/centrifugo/releases/download/v$VERSION/centrifugo-$VERSION-$RELEASE.x86_64.rpm

# preparing permissions
RUN groupadd -r centrifugo && useradd -r -g centrifugo centrifugo
RUN mkdir /centrifugo && chown centrifugo:centrifugo /centrifugo

VOLUME /centrifugo
WORKDIR /centrifugo

# installing Centrifugo
RUN curl -sSL "$DOWNLOAD" -o centrifugo.rpm && \
    yum localinstall -y centrifugo.rpm && \
    yum clean all && \
    rm -f centrifugo.rpm

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
CMD ["centrifugo"]
