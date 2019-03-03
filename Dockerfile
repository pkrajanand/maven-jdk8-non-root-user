# Maven 3.6.0 on JDK-8 with a non-root user as default
FROM maven:3.6.0-jdk-8-alpine

MAINTAINER rajpk <pkrajanand@gmail.com>

ENV USER_HOME=/home/build

RUN addgroup build &&\
    adduser -D -S -h $USER_HOME -s /sbin/nologin -G build -u 1000 build

RUN chown build:build $USER_HOME -R

USER build

WORKDIR /home/build
