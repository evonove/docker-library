FROM centos:centos7
MAINTAINER info@evonove.it

# Configure repos
RUN yum localinstall -y http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm

# Install postgres
RUN yum --disablerepo="*" --enablerepo=pgdg93 install -y postgresql93-server
RUN yum clean all

# Configure postgres
USER postgres

ADD ./pg_hba.conf /etc/pgsql/9.3/
ADD ./postgresql.conf /etc/pgsql/9.3/

USER root

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/var/lib/pgsql"]

# Set the default command to run when starting the container
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["postgres"]
