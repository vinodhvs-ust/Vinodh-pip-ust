# Use alpine hardened image
FROM alpine:latest
# Switch to root user
USER root
# Setting env  variable for java zulu version
ENV ZULU_JDK_VERSION=zulu11
# Create directory for java binaries
RUN mkdir /usr/share/java
# Downloading the latest ver of java11 from zulu repo
RUN LTS_VERSION=$(curl -s https://cdn.azul.com/zulu/bin/index.yml | grep $ZULU_JDK_VERSION | awk 'END {print $2}' | awk -F'jre' '{print $NF}' | cut -d '-' -f1) && \
    BINARY_FILE=$(curl -s https://cdn.azul.com/zulu/bin/ | grep jdk$LTS_VERSION-linux_musl | cut -d '>' -f3 | cut -d '<' -f1) && \
    curl https://cdn.azul.com/zulu/bin/$BINARY_FILE -o $BINARY_FILE && \
    tar xf $BINARY_FILE -C /usr/share/java --strip-components=1 && \
    rm -Rf $BINARY_FILE
#adding path 
ENV  PATH=/usr/share/java/bin/:$PATH
######Helm installation######
RUN \
  apk  add --update wget && \
  wget https://get.helm.sh/helm-v3.9.0-linux-amd64.tar.gz && \
  tar -zxvf helm-v3.9.0-linux-amd64.tar.gz && \
RUN helm --version  

###AWS cli installation 
RUN apk add --no-cache \
        python3 \
        py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
        awscli \
    && rm -rf /var/cache/apk/*

RUN aws --version


