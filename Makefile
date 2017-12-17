SHELL:=/bin/bash

demo1:
	zip hello.zip hello.js

	aws s3 cp hello.zip s3://dans-bukkit/demo/

	aws cloudformation create-stack --stack-name hello --capabilities CAPABILITY_NAMED_IAM --template-body file://demo1_lambda.yml --parameters ParameterKey=DeploymentBucket,ParameterValue=dans-bukkit

demo2:
	aws cloudformation update-stack --stack-name hello --capabilities CAPABILITY_NAMED_IAM --template-body file://demo2_api.yml --parameters ParameterKey=DeploymentBucket,ParameterValue=dans-bukkit

demo3a:
	aws cloudformation create-stack --stack-name base --template-body file://demo3_sharing.yml --parameters ParameterKey=DeploymentBucketName,ParameterValue=mynewdeploymentbucketweeee

demo3b:
	aws s3 rm s3://dans-bukkit/demo/hello.zip

	aws s3 cp hello.zip s3://mynewdeploymentbucketweeee/demo/

	aws cloudformation update-stack --stack-name hello --capabilities CAPABILITY_NAMED_IAM --template-body file://demo3_api.yml
