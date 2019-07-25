FROM alpine:3.10
MAINTAINER Richard Selby <richard.selby@york.ac.uk>

# Install AWS CLI
# From https://github.com/xueshanf/docker-awscli/blob/master/Dockerfile
RUN apk --no-cache add \ 
      bash \
      curl \
      less \
      groff \
      jq \
      git \
      python \
      py-pip \
      py2-pip && \
      pip install --upgrade pip awscli s3cmd && \
      mkdir /root/.aws

# Install docker-compose
# From https://wiki.alpinelinux.org/wiki/Docker#Docker_Compose
RUN apk --no-cache add python-dev libffi-dev openssl-dev gcc libc-dev make
RUN pip install docker-compose
