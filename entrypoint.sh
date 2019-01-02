#!/bin/sh

TF_VAR_ami=$(curl -s https://coreos.com/dist/aws/aws-stable.json | jq --arg region "$AWS_REGION" -r '.[$region].hvm') /bin/terraform $cmd "$@"
