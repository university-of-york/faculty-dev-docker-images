FROM ubuntu:latest
FROM public.ecr.aws/lambda/ruby:3.3

# Don't complain if bundler is run as root
ENV BUNDLE_SILENCE_ROOT_WARNING=1

RUN yum install -y amazon-linux-extras yum-utils \
  && yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo \
  && amazon-linux-extras enable postgresql14 \
  && yum install -y \
  postgresql \
  postgresql-devel \
  sqlite-devel \
  openssl-devel \
  wget \
  make \
  gcc \
  gcc-c++ \
  git \
  gh \
  && yum clean all \
  && rm -rf /var/cache/yum

RUN gem install bundler

# Override default lambda entrypoint
ENTRYPOINT []

# Set default command to match the ruby docker images
CMD ["irb"]
