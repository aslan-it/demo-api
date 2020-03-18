#!/bin/bash

set -eo pipefail


aws cloudformation deploy \
    --capabilities CAPABILITY_NAMED_IAM \
    --template-file aws/iam.yml \
    --stack-name iam

aws cloudformation deploy \
    --template-file aws/vpc.yml \
    --stack-name vpc

aws cloudformation deploy \
    --template-file aws/app-cluster.yml \
    --stack-name app-cluster

aws cloudformation deploy \
    --template-file aws/api.yml \
    --stack-name api

aws cloudformation deploy \
    --capabilities CAPABILITY_NAMED_IAM \
    --template-file aws/dynamodb.yml \
    --stack-name dynamodb \
    --parameter-overrides $(cat aws/demo.properties)

aws cloudformation deploy \
    --capabilities CAPABILITY_NAMED_IAM \
    --template-file aws/lambda.yml \
    --stack-name lambda

aws cloudformation deploy \
    --capabilities CAPABILITY_NAMED_IAM \
    --template-file aws/sns.yml \
    --stack-name sns


ProjectName="demo-api"
RepositoryName="demo-api"
DockerImageRepository="DockerImageRepository"

aws cloudformation deploy \
    --template-file cloudformation/vpc.yaml \
    --stack-name ${ProjectName}-pipeline \
    --parameter-overrides \
        ProjectName=${ProjectName} \
        RepositoryName=${RepositoryName} \
        DockerImageRepository=${DockerImageRepository} \
    --no-fail-on-empty-changeset