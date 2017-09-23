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
  cd target/universal && \
  unzip play-java-chatroom-example-*.zip

# Still not possible to set ENV with command result
# Open issue: https://github.com/moby/moby/issues/29110
# ENV DEPLOY_DIR `find . -maxdepth 1 -type d -name 'play-java-chatroom-example*' -print -quit`

# Have to hard code here
ENV DEPLOY_DIR target/universal/play-java-chatroom-example-2.6.x

# Enter the deployment bin dir
WORKDIR $DEPLOY_DIR/bin

COPY conf/localtest.conf ../conf/

CMD ["./play-java-chatroom-example", "-Dconfig.file=../conf/localtest.conf"]
