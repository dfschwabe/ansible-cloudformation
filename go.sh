export ANSIBLE_VAULT_PASSWORD_FILE=.vault_pass

zip hello.zip handler.js
aws s3 cp hello.zip s3://dans-bukkit/dev/hello/
ansible localhost -m template -a "src=template.json.j2 dest=./template.json" -e @vars.yaml -e "stage=dev"
aws cloudformation create-stack --stack-name hello --capabilities CAPABILITY_NAMED_IAM --template-body file://template.json
