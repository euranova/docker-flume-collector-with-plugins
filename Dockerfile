FROM openjdk:8-jdk

ENV FLUME_VERSION 1.7.0
ENV FLUME_AGENT my-flume-agent

WORKDIR /opt

RUN wget -O flume.tar.gz http://archive.apache.org/dist/flume/$FLUME_VERSION/apache-flume-$FLUME_VERSION-bin.tar.gz \
    && tar -xvzf flume.tar.gz \
    && mv /opt/apache-flume-$FLUME_VERSION-bin/ /opt/apache-flume-bin/

WORKDIR /opt/apache-flume-bin/

ADD entrypoint.sh /

RUN mkdir /data-source /flume /opt/apache-flume-bin/plugins.d \
    && chmod +x /entrypoint.sh

CMD /entrypoint.sh
