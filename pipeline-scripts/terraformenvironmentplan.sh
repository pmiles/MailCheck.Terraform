#!/bin/bash
BASE_PATH=$PWD
cd Terraform/prod-env/prod-env
$BASE_PATH/terraform/terraform init -no-color -backend=true -force-copy -input=false -backend-config="key=$STATE_KEY/terraform.tfstate"
set +e
echo "Starting PLAN: tfvars: $BASE_PATH/$STATE_KEY.dynamic.tfvars $BASE_PATH/Terraform/prod-env/$STATE_KEY.tfvars"
ls -l $BASE_PATH/$STATE_KEY.dynamic.tfvars 
ls -l $BASE_PATH/Terraform/prod-env/$STATE_KEY.tfvars
$BASE_PATH/terraform/terraform plan -no-color -detailed-exitcode -refresh=true -out=$BASE_PATH/$STATE_KEY.plan.out -var-file=$BASE_PATH/$STATE_KEY.dynamic.tfvars -var-file=$BASE_PATH/Terraform/prod-env/$STATE_KEY.tfvars .
set -e
if [ $? == 1 ]; then
  exit 1
fi
if [ $? == 2 ]; then
echo "Terraform changes will be committed to the $ENV_NAME environment"
exit 0
fi;
