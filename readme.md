# Bitbucket Pipeline Build Environments

Useful images to use in bitbucket pipelines.

### When to use these images?

Bitbucket [won't cache private images](https://community.atlassian.com/t5/Bitbucket-questions/A-cache-for-custom-private-pipeline-image/qaq-p/1110065).
So only use these images when there is no suitable public image from a reputable source
(see the [policy](https://wiki.york.ac.uk/pages/viewpage.action?pageId=176922236)) that does what you want;
or when adding your required tools to an existing image takes longer than the download from a private repo (~10s).

For example - installing aws-cli on alpine linux takes a couple of seconds:

```
- apk add python3
- pip3 install awscli
```

This is much quicker than using a private image.

Don't forget - you can use different images for different steps.

### Using the images

AWS credentials must be provided to download the image.
A user should be set up with the appropriate access and the access keys saved to the Repository variables settings in the bitbucket repository.

If a pipeline is doing other things with AWS (e.g. cloudformation),
it might be sensible to provide two sets of AWS credentials;
the defaults (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) for within
the pipeline, and separate `BUILD_ENVIRONMENT` keys that can just access
the docker image:

```
image:
  name: <id>.dkr.ecr.eu-west-1.amazonaws.com/<name>:latest
  aws:
    access-key: $AWS_BUILD_ENVIRONMENT_ACCESS_KEY_ID
    secret-key: $AWS_BUILD_ENVIRONMENT_SECRET_ACCESS_KEY
```

## `aws-cli` and `docker-compose`

`docker-compose` is slow to install, so we have a base image with that and `aws-cli`.

### Using this image

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
