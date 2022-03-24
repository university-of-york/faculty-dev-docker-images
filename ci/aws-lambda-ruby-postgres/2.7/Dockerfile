FROM public.ecr.aws/lambda/ruby:2.7

ENV TZ=Europe/London

# Add lambda layer with postgres libraries
ADD sys-layer-ruby-pg.tgz /opt

# Override default lambda entrypoint
ENTRYPOINT []

# Set default command to match the ruby docker images
CMD ["irb"]
