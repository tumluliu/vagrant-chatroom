# 
# Web chat demo in Scala
#
# https://github.com/playframework/play-java-chatroom-example
#

# Pull the base image
FROM hseeberger/scala-sbt:8u141-jdk_2.12.3_1.0.1

# Install git
RUN \
  apt-get update && \
  apt-get install git

# Clone chatroom repo
RUN \
  git clone https://github.com/playframework/play-java-chatroom-example.git /chatroom

# Define working directory
WORKDIR /chatroom

# Package chatroom with sbt
RUN \
  sbt clean test dist

# Unzip chatroom package to /chatroom/deploy/
RUN \
  unzip target/universal/play-java-chatroom-example-*.zip


ENV DEPLOY_DIR `find target/universal -maxdepth 1 -type d -name 'play-java-chatroom-example*' -print -quit`

# Enter the deployment bin dir
WORKDIR $DEPLOY_DIR/bin

COPY conf/localtest.conf ../conf/
