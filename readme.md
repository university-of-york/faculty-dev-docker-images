# Docker Images for CI Pipelines

Useful images to use in workflows.

## AWS Lambda Ruby

### CI

#### ghcr.io/university-of-york/faculty-dev-ci-images/ci/aws-lambda-ruby-postgres:2.7

This should be identical to the image used in AWS lambdas. Run your tests in this image where possible.

We are including the [shared lambda layer](https://wiki.york.ac.uk/display/CLOUD/AWS%3A+Shared+Lambda+Layers)
provided by SYS to match the production environment.

#### ghcr.io/university-of-york/faculty-dev-ci-images/ci/aws-lambda-ruby-dev:2.7

This is the base AWS ruby lambda with tools installed that allow us to install and build gems. 

Feel free to add additional tooling to this image as required.

### Local Dev

#### ghcr.io/university-of-york/faculty-dev-ci-images/local-dev/aws-lambda-ruby-dev:2.7

This is the dev CI image tweaked for local development work (with docker-compose).

It will install gems into `/bundler`, which should be a volume shared with the `app` container, so this image can
install the gems, and the app can use them (see 
[sinatra-base](https://github.com/university-of-york/faculty-dev-sinatra-base/blob/main/docker-compose.yml))
for an example).

#### ghcr.io/university-of-york/faculty-dev-ci-images/local-dev/aws-lambda-ruby-postgres:2.7

This is the postgres CI image tweaked for local development work.

* Add `rerun` to reload the app when code changes are detected.
* Set up bundler to use `/bundler` (see `aws-lambda-ruby-builder` above)
* Open port 9292 and set the default command to run `rerun`

Rerun is installed separately and the gem copied into the local image to avoid 'polluting' the main app image
with build tools.

##### Limitations

We are still skipping the lambda handler here; we would need to set up a mock Load Balancer to take a request 
(e.g. http://localhost) and convert it to a lambda event. This could be looked at in the future to *really* match
the production environment, but at the time of writing, there doesn't seem to be an easy way to mock the Load Balancer.
