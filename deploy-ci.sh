#!/bin/bash

set -eo pipefail

ProjectName="demo-api"
RepositoryName="demo-api"
DockerImageRepository="demo-api"

aws cloudformation deploy \
    --template-file aws/pipeline.yaml \
    --stack-name ${ProjectName}-pipeline \
    --parameter-overrides \
        ProjectName=${ProjectName} \
        RepositoryName=${RepositoryName} \
        DockerImageRepository=${DockerImageRepository} \
    --no-fail-on-empty-changeset \
    --capabilities CAPABILITY_NAMED_IAM
