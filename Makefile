SHELL:=/bin/bash

.PHONY : create update

create:
	aws cloudformation update-stack --stack-name hello --capabilities CAPABILITY_NAMED_IAM --template-body file://$(file)--parameters ParameterKey=DeploymentBucket,ParameterValue=dans-bukkit

update:
	aws cloudformation update-stack --stack-name hello --capabilities CAPABILITY_NAMED_IAM --template-body file://$(file) --parameters ParameterKey=DeploymentBucket,ParameterValue=dans-bukkit
