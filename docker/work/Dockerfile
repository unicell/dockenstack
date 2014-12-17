FROM ubuntu:trusty
MAINTAINER Qiu Yu "unicell@gmail.com"

# Init work env
RUN apt-get install -qqy curl
RUN ["bash", "-c", "bash -c \"$(curl -fsSL https://raw.github.com/unicell/dotfiles/master/bin/dotfiles)\" source ~/.bashrc"]

# Setup stack user
RUN mkdir -p /opt; \
    useradd -m -s /bin/bash -d /opt/stack stack
ADD conf/stack.sudo /etc/sudoers.d/stack
RUN chown root:root /etc/sudoers.d/stack

# Extra packages needed
RUN sudo apt-get install -qqy \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    libmysqlclient-dev

# Repo needed
WORKDIR /opt/stack
RUN git clone https://github.com/openstack/nova.git

# Conf files
RUN mkdir -p /pip-cache /root/.pip
ADD conf/pip.conf /root/.pip/pip.conf

# Local scripts
ADD scripts /opt/stack/bin
RUN chmod 755 /opt/stack/bin/*

CMD ["/opt/stack/bin/start.sh"]
