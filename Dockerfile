FROM alpine:3.10
MAINTAINER Richard Selby <richard.selby@york.ac.uk>

# Additional requirements for docker-compose
# From https://wiki.alpinelinux.org/wiki/Docker#Docker_Compose
RUN apk --no-cache add \
    gcc \
    libc-dev \
    libffi-dev \
    make \
    openssl-dev \
    python3-dev \
    python3

RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir awscli s3cmd
RUN pip3 install --no-cache-dir docker-compose

RUN mkdir /root/.aws
