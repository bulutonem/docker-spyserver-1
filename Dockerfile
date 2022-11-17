FROM ubuntu:latest

ARG TARGETPLATFORM
ENV TARGETPLATFORM "$TARGETPLATFORM"

RUN apt-get update
RUN apt-get install -y hackrf libhackrf-dev wget

RUN set -ex; \
    wget https://airspy.com/downloads/spyserver-arm64.tgz;\
    tar xvzf spyserver-arm64.tgz;\
    rm spyserver-arm64.tgz

RUN mv spyserver spyserver_ping /usr/bin
RUN mkdir -p /etc/spyserver
RUN mv spyserver.config /etc/spyserver

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
