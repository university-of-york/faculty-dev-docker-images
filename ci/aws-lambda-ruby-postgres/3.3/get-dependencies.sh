#!/bin/sh

# Gets a zip file for the given lambda layer ARN

# TODO: FD-2030 - Dev SYS AWS account - use production ARN when available
LAYER_ARN=arn:aws:lambda:eu-west-1:777293634910:layer:sys-layer-ruby-pg:1
URL=$(aws lambda get-layer-version-by-arn --arn $LAYER_ARN --query Content.Location --output text)
curl -s $URL -o sys-layer-ruby-pg.zip

# Convert the zip to tgz so docker can ADD the archive automatically

unzip -q sys-layer-ruby-pg.zip -d layer
tar -C layer -zcf sys-layer-ruby-pg.tgz .
rm -rf layer sys-layer-ruby-pg.zip
