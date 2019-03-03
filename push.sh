#!/usr/bin/env bash
source ./env.sh
imageRef=`docker images | grep maven-non-root | grep 3.6.0-jdk-8-alpine | awk '{print $3}'`
docker tag "$imageRef" rajpk/maven-build-user:$VERSION
docker push rajpk/maven-build-user
