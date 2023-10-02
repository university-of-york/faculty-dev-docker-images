FROM public.ecr.aws/lambda/ruby:3.2

# Install tools used when installing / building gems
RUN yum install -y postgresql-devel sqlite-devel wget make gcc gcc-c++ git \
 && yum clean all \
 && rm -rf /var/cache/yum

# Don't complain if bundler is run as root
ENV BUNDLE_SILENCE_ROOT_WARNING=1

# Install GitHub CLI for actions
RUN yum install -y yum-utils \
 && yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo \
 && yum install -y gh \
 && yum clean all \
 && rm -rf /var/cache/yum

# Override default lambda entrypoint
ENTRYPOINT []

# Set default command to match the ruby docker images
CMD ["irb"]
