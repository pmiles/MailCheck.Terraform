#!/bin/bash
BASE_PATH=$PWD
cd Terraform/common/common
$BASE_PATH/terraform/terraform init -no-color -backend=true -force-copy -input=false -backend-config="key=common/terraform.tfstate"
set +e
$BASE_PATH/terraform/terraform plan -no-color -detailed-exitcode -refresh=true -out=$BASE_PATH/common-plan.out -var-file=$BASE_PATH/Terraform/common/common.tfvars .
set -e
if [ $? == 1 ]; then
  exit 1
fi
if [ $? == 2 ]; then
echo "Terraform changes will be committed to the Common environment"
exit 0
fi;
