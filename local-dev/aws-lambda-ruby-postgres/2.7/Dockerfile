FROM ghcr.io/university-of-york/faculty-dev-docker-images/ci/aws-lambda-ruby-dev:2.7 as app-build

RUN gem install rerun:'~> 0.11'

###############################################################################
FROM ghcr.io/university-of-york/faculty-dev-docker-images/ci/aws-lambda-ruby-postgres:2.7

COPY --from=app-build /var/lang /var/lang

EXPOSE 9292

ENV GEM_PATH /bundle
ENV BUNDLE_PATH /bundle

# Start server
CMD ["rerun", "--background", "bundle", "exec", "rackup --host 0.0.0.0"]
