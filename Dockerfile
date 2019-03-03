# Maven 3.6.0 on JDK-8 with a non-root user as default
FROM maven:3.6.0-jdk-8-alpine

MAINTAINER rajpk <pkrajanand@gmail.com>

ARG USER_HOME_DIR=/home/build

RUN addgroup build &&\
    adduser -D -S -h $USER_HOME_DIR -s /sbin/nologin -G build -u 1000 build

RUN chown build:build $USER_HOME_DIR -R

ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

USER build

WORKDIR /home/build
