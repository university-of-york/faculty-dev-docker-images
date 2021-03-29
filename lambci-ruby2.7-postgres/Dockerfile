FROM lambci/lambda:build-ruby2.7

RUN yum install -y postgresql-devel wget \
 && yum clean all \
 && rm -rf /var/cache/yum
