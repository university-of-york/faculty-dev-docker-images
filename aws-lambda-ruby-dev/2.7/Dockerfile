FROM public.ecr.aws/lambda/ruby:2.7

RUN yum install -y postgresql-devel wget make gcc gcc-c++ \
 && yum clean all \
 && rm -rf /var/cache/yum

ENV BUNDLE_SILENCE_ROOT_WARNING=1

ENTRYPOINT []
CMD ["irb"]
