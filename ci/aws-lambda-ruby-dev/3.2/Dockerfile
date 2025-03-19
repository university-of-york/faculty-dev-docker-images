FROM public.ecr.aws/lambda/ruby:3.2

# Don't complain if bundler is run as root
ENV BUNDLE_SILENCE_ROOT_WARNING=1

RUN yum install -y amazon-linux-extras yum-utils \
  && yum-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo \
  && amazon-linux-extras enable postgresql14

# Hopefully a temporary fix until AWS include the mirror for openssl-snapsafe-libs in the base Lambda image
# Mirror needs be added after command enabling postgresql14, otherwise any pre-existing amzn2-extras.repo is
# overwritten. See https://github.com/aws/aws-lambda-base-images/issues/245
RUN <<EOF
cat >> /etc/yum.repos.d/amzn2-extras.repo << 'EOREPO'
[amzn2extra-openssl-snapsafe]
name=Amazon Extras repo for openssl-snapsafe
enabled=1
mirrorlist=$awsproto://$amazonlinux.$awsregion.$awsdomain/2/extras/openssl-snapsafe/latest/$basearch/mirror.list
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-amazon-linux-2
priority=10
skip_if_unavailable=1
report_instanceid=yes
EOREPO
EOF

RUN yum install -y \
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
  xz \
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
