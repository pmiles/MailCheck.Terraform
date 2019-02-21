#!/bin/bash
BASE_PATH=$PWD
cd Terraform/prod-env/prod-env
$BASE_PATH/terraform/terraform apply -no-color $BASE_PATH/$STATE_KEY.plan.out
