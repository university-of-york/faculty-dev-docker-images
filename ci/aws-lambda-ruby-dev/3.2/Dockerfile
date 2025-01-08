FROM public.ecr.aws/lambda/ruby:3.2

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
  tar \
  libffi-devel \
  && yum clean all \
  && rm -rf /var/cache/yum

# Acquire a version of node20 that will run on AL2
RUN mkdir /node_al2 \
  && curl -SL https://unofficial-builds.nodejs.org/download/release/v20.10.0/node-v20.10.0-linux-x64-glibc-217.tar.gz \
  | tar xz --strip-components 1 -C /node_al2

RUN gem install bundler

# Override default lambda entrypoint
ENTRYPOINT []

# Set default command to match the ruby docker images
CMD ["irb"]
