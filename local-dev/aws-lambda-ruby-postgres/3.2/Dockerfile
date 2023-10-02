FROM ghcr.io/university-of-york/faculty-dev-docker-images/ci/aws-lambda-ruby-dev:3.2 as app-build

# We must install rerun in a dev image that has build tools installed
RUN gem install rerun:'~> 0.13'

###############################################################################
FROM ghcr.io/university-of-york/faculty-dev-docker-images/ci/aws-lambda-ruby-postgres:3.2

# Pick up rerun gem from build stage
COPY --from=app-build /var/lang /var/lang

# Open port for local development
EXPOSE 9292

# Use /bundle for gems
ENV GEM_PATH /bundle
ENV BUNDLE_PATH /bundle
ENV BUNDLE_CLEAN true

# Start server using rerun to reload if code changes are detected
CMD ["rerun", "--background", "bundle", "exec", "rackup --host 0.0.0.0 --quiet"]
