FROM ubuntu:trusty
MAINTAINER Qiu Yu "unicell@gmail.com"

RUN apt-get update; \
    apt-get install -qqy \
    git curl vim wget net-tools sudo \
    python-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    libmysqlclient-dev \
    libpq-dev \
    pkg-config \
    libvirt-dev \
    libkrb5-dev \
    python-pip

RUN pip install wheel

# Local scripts
ADD scripts /opt/dockenstack/bin
RUN chmod 755 /opt/dockenstack/bin/*

WORKDIR /
CMD ["/opt/dockenstack/bin/build-wheel-cache.sh"]
