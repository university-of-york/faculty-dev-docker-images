FROM public.ecr.aws/lambda/ruby:3.3

# Don't complain if bundler is run as root
ENV BUNDLE_SILENCE_ROOT_WARNING=1

RUN dnf install -y 'dnf-command(config-manager)' \
  && dnf-3 config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo \
  && dnf install -y \
  postgresql15 \
  postgresql-devel \
  sqlite-devel \
  openssl-devel \
  wget \
  make \
  gcc \
  gcc-c++ \
  git \
  gh \
  && dnf clean all \
  && rm -rf /var/cache/yum

RUN gem install bundler

# Override default lambda entrypoint
ENTRYPOINT []

# Set default command to match the ruby docker images
CMD ["irb"]
