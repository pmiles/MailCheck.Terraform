#!/bin/bash
if [ "$ENV_NAME" = "prod" ]; then
    BASE_PATH=$PWD
    cd Terraform/common/common
    $BASE_PATH/terraform/terraform apply -no-color $BASE_PATH/common-plan.out
else
    echo "Not applying terraform common in outside prod, this is $ENV_NAME"
fi
