FROM public.ecr.aws/lambda/ruby:3.4

# Don't complain if bundler is run as root
ENV BUNDLE_SILENCE_ROOT_WARNING=1

# microdnf doesn't seem to handle keyrings with multiple published keys well, specifically when
# one key is expired, so import the GitHub CLI repo's keyring directly via rpm
RUN dnf install -y 'dnf-command(config-manager)' \
  && dnf-3 config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo \
  && rpm --import https://cli.github.com/packages/githubcli-archive-keyring.asc \
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
