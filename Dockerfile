FROM python:3.8.0-alpine3.10
MAINTAINER Richard Selby <richard.selby@york.ac.uk>

# Additional requirements for docker-compose
# From https://wiki.alpinelinux.org/wiki/Docker#Docker_Compose
RUN apk --no-cache add \
    gcc \
    libc-dev \
    libffi-dev \
    make \
    openssl-dev \
    python-dev

RUN pip install --no-cache-dir awscli s3cmd
RUN pip install --no-cache-dir docker-compose

RUN mkdir /root/.aws
