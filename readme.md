# Docker Images for CI Pipelines

Useful images to use in pipelines.

These were originally built in bitbucket and pushed to AWS ECR - but bitbucket pipelines do not cache
private docker images. We're moving them to github to see if it improves the speed of our pipelines.

## `aws-cli` and `aws-sam`

For deploying lambdas to AWS.

## `aws-cli` and `docker-compose`

`docker-compose` is slow to install, so we have a base image with that and `aws-cli`.

### Using this image in bitbucket

To use `docker-compose` in a pipeline, you must also declare docker as a service. This can be done globally:

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
