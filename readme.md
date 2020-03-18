# Getting Started

### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.2.4.RELEASE/maven-plugin/)

### Dockerize a simple app

```
# Run on local
docker build -t demo-api .
docker run -it -p 8080:8080 --rm demo-api:latest
open http://localhost:8080/api/hello
```

### Push Docker Image to ECR

```
aws ecr create-repository --repository-name demo-api
aws ecr get-login --no-include-email | sh 
IMAGE_REPO=$(aws ecr describe-repositories --repository-names demo-api --query 'repositories[0].repositoryUri' --output text)
docker tag demo-api:latest $IMAGE_REPO:latest
docker push $IMAGE_REPO:latest
```



### Create CloudFormation S tacks

```
aws cloudformation create-stack --template-body file://$PWD/aws/vpc.yml --stack-name vpc

aws cloudformation create-stack --template-body file://$PWD/aws/iam.yml --stack-name iam --capabilities CAPABILITY_IAM

aws cloudformation create-stack --template-body file://$PWD/aws/app-cluster.yml --stack-name app-cluster

# Edit the api.yml to update Image tag/URL under Task > ContainerDefinitions and,
aws cloudformation create-stack --template-body file://$PWD/aws/api.yml --stack-name api

```
