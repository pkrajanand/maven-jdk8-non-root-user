# Maven 3.6.0 on JDK-8 with a non-root user as default
FROM maven:3.6.0-jdk-8-alpine

MAINTAINER rajpk <pkrajanand@gmail.com>

# RUN useradd --create-home --shell /bin/bash --gid build --uid build

RUN addgroup build && \
    adduser -D -S -h /var/cache/build -s /sbin/nologin -G build build  -u 1000

USER build

RUN mkdir -p /var/cache/build/.m2
VOLUME /var/cache/build/.m2
WORKDIR /var/cache/build

ENV USER_HOME=/var/cache/build
ENV MAVEN_CONFIG=/enableHR/
