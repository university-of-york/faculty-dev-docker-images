# Fractionally smaller to install on alpine rather than use python:3-alpine as a base...
FROM alpine:3.12
MAINTAINER Rick Selby <richard.selby@york.ac.uk>

RUN apk --no-cache add py3-pip gcc musl-dev python3-dev
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir awscli s3cmd aws-sam-cli
RUN mkdir /root/.aws
