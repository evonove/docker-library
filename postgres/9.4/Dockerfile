FROM evonove/scratch
MAINTAINER Emanuele Palazzetti <hello@palazzetti.me>

# making the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
ENV LANG en_US.utf8

ENV PG_MAJOR 9.4
ENV PG_VERSION 9.4.3

# installing postgres
RUN yum localinstall -y http://yum.postgresql.org/$PG_MAJOR/redhat/rhel-7-x86_64/pgdg-centos94-9.4-1.noarch.rpm && \
  yum --disablerepo="*" --enablerepo=pgdg94 install -y postgresql94-server-$PG_VERSION && \
  yum clean all

# configuring postgresql
ENV PATH /usr/pgsql-$PG_MAJOR/bin:$PATH
ENV PGDATA /var/lib/pgsql/$PG_MAJOR/data/

ADD ./pg_hba.conf /etc/pgsql/$PG_MAJOR/
ADD ./postgresql.conf /etc/pgsql/$PG_MAJOR/

VOLUME  ["/var/lib/pgsql/"]

# Set the default command to run when starting the container
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]
