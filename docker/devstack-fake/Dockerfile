# Eric Windisch '2014
# Forked from code by original author: Paul Czarkowski

FROM unicell/devstack-base
MAINTAINER Qiu Yu "unicell@gmail.com"

EXPOSE 80 5000 8773 8774 8776 9292

# Local scripts
ADD scripts /opt/dockenstack/bin
RUN chmod 755 /opt/dockenstack/bin/*

WORKDIR /devstack
ADD localrc /devstack/localrc
ADD localrc.d /devstack/localrc.d

WORKDIR /
# Fix ownership of all files
RUN chown -R devstack /devstack

CMD ["/opt/dockenstack/bin/start"]
