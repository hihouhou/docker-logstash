#
#  logstash Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV LOGSTASH_VERSION logstash_1.5.4-1

# Update & install packages for graylog
RUN apt-get update && \
    apt-get install -y wget dpkg-dev logrotate openjdk-7-jre
RUN wget https://download.elastic.co/logstash/logstash/packages/debian/logstash_1.5.4-1_all.deb && \
    dpkg -i ${LOGSTASH_VERSION}_all.deb

#Configure graylog
ADD logstash-simple.conf /etc/logstash/

WORKDIR /etc/logstash/

CMD ["/opt/logstash/bin/logstash", "-f", "logstash-simple.conf"]
