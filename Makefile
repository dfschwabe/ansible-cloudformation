SHELL:=/bin/bash

demo1:
	zip hello.zip hello.js

	aws s3 cp hello.zip s3://dans-bukkit/demo/

	aws cloudformation create-stack --stack-name hello --template-body file://demo1_lambda.yml --capabilities CAPABILITY_NAMED_IAM  --parameters ParameterKey=DeploymentBucket,ParameterValue=dans-bukkit

demo2:
	aws cloudformation update-stack --stack-name hello --template-body file://demo2_api.yml --capabilities CAPABILITY_NAMED_IAM  --parameters ParameterKey=DeploymentBucket,ParameterValue=dans-bukkit

demo3a:
	aws cloudformation create-stack --stack-name base --template-body file://demo3_shared_config.yml --parameters ParameterKey=DeploymentBucketName,ParameterValue=mynewdeploymentbucketweeee

demo3b:
	aws s3 rm s3://dans-bukkit/demo/hello.zip

	aws s3 cp hello.zip s3://mynewdeploymentbucketweeee/demo/

	aws cloudformation update-stack --stack-name hello --template-body file://demo3_api.yml --capabilities CAPABILITY_NAMED_IAM

demo4a:
	aws cloudformation delete-stack --stack-name hello

	aws s3 cp demo4_api.template s3://mynewdeploymentbucketweeee/demo/

demo4b:
	aws cloudformation create-stack --stack-name hello --template-body file://demo4_nested.yml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=ServiceName,ParameterValue=hello

demo4c:
	zip goodbye.zip goodbye.js

	aws s3 cp goodbye.zip s3://mynewdeploymentbucketweeee/demo/

	aws cloudformation create-stack --stack-name goodbye --template-body file://demo4_nested.yml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=ServiceName,ParameterValue=goodbye
