# MySQL container used for local development environment
#
# Version 0.1.0

FROM ubuntu:12.04

MAINTAINER Wiliam Souza <wiliamsouza83@gmail.com>

# Base
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main restricted universe multiverse" > /etc/apt/sources.list

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y python-software-properties

RUN dpkg-divert --local --rename --add /sbin/initctl

# Environment

# sources

# pass

# update
RUN apt-get update

# mysql-server
RUN apt-get install mysql-server -y

RUN update-rc.d -f mysql disable

ADD bind.cnf /etc/mysql/conf.d/bind.cnf

# start script
ADD startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

# supervisord
RUN apt-get install supervisor -y
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/var/lib/mysql", "/var/log/mysql", "/etc/mysql/conf.d"]

EXPOSE 3306

CMD ["/usr/local/bin/startup"]
