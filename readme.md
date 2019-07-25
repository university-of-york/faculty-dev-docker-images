# aws-cli / docker-compose Docker Image

The Teaching Portal pipeline requires both `aws-cli` and `docker-compose`, so here is a base image to use.

## Using the image

AWS credentials must be provided to download the image.
A user should be set up with the appropriate access and the access keys saved to the Repository variables settings in the bitbucket repository. 

```
image:
  name: <id>.dkr.ecr.eu-west-1.amazonaws.com/docker-aws-cli-compose:latest
  aws:
    access-key: $AWS_ACCESS_KEY_ID
    secret-key: $AWS_SECRET_ACCESS_KEY
```

The `aws` command expects the following environment variables to be defined:
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

This does not add `docker` itself; that must still be declared as a service in your pipelines configuration.

This can be done globally:

```
options:
  docker: true
```

Or per step:

```
pipelines:
  default:
    - step:
        services:
          - docker
```

## Background

* `aws-cli`
  * Required for logging into docker before pushing/pulling images from an ECR instance.
    * `eval $(aws ecr get-login --region ${AWS_DEFAULT_REGION} --no-include-email)`
* `docker-compose`
  * Running tests in a docker container that need to talk to a database is tricky if the database is defined as a service; 
    it's easier to define a `docker-compose` configuration with the test image and the database so they can communicate.

