FROM public.ecr.aws/lambda/ruby:3.2

# Don't complain if bundler is run as root
ENV BUNDLE_SILENCE_ROOT_WARNING=1

RUN yum install -y amazon-linux-extras

RUN amazon-linux-extras enable postgresql14

RUN yum install -y \
  postgresql14 \
  postgresql14-private-devel \
  sqlite-devel \
  openssl-devel \
  wget \
  make \
  gcc \
  gcc-c++ \
  git

RUN gem install bundler

# Override default lambda entrypoint
ENTRYPOINT []

# Set default command to match the ruby docker images
CMD ["irb"]
