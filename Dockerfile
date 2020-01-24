FROM alpine:3.11
MAINTAINER Richard Selby <richard.selby@york.ac.uk>

# Install aws-cli
RUN apk --no-cache add py3-pip
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir awscli s3cmd
RUN mkdir /root/.aws

# Install docker-compose
# Additional requirements for docker-compose
# From https://wiki.alpinelinux.org/wiki/Docker#Docker_Compose
RUN apk --no-cache add \
    gcc \
    libc-dev \
    libffi-dev \
    make \
    openssl-dev \
    python3-dev

RUN pip3 install --no-cache-dir docker-compose
