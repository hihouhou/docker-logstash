#
#  logstash Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV LOGSTASH_VERSION v8.14.2

# Update & install packages for logstash
RUN apt-get update && \
    apt-get install -y wget dpkg-dev logrotate openjdk-11-jre

#Install logstash
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-${LOGSTASH_VERSION}-amd64.deb && \
    dpkg -i logstash-${LOGSTASH_VERSION}-amd64.deb && \
    usermod -u 1000 logstash

#Configure logstash
ADD logstash.yml /etc/logstash/logstash.yml

USER logstash

CMD ["/usr/share/logstash/bin/logstash", "-f", "/etc/logstash/logstash.yml"]
