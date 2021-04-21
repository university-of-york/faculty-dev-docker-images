FROM public.ecr.aws/lambda/ruby:2.7

# Install tools used when installing / building gems
RUN yum install -y postgresql-devel wget make gcc gcc-c++ git \
 && yum clean all \
 && rm -rf /var/cache/yum

# Don't complain if bundler is run as root
ENV BUNDLE_SILENCE_ROOT_WARNING=1

# Override default lambda entrypoint
ENTRYPOINT []

# Set default command to match the ruby docker images
CMD ["irb"]
