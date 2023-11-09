FROM public.ecr.aws/amazonlinux/amazonlinux:2023

# Don't complain if bundler is run as root
ENV BUNDLE_SILENCE_ROOT_WARNING=1

RUN dnf install -y ruby \
  ruby-devel

RUN dnf install -y \
  postgresql15 \
  postgresql15-private-devel \
  sqlite-devel \
  openssl-devel \
  wget \
  make \
  gcc \
  gcc-c++ \
  git

RUN dnf clean all

RUN gem install bundler

# Override default lambda entrypoint
ENTRYPOINT []

# Set default command to match the ruby docker images
CMD ["irb"]
