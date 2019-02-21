#!/bin/bash

echo dotnet-container-githash=\"$SHORT_HASH\" | tee $STATE_KEY.dynamic.tfvars
echo frontend-container-githash=\"\" | tee -a $STATE_KEY.dynamic.tfvars
echo allowed-account-ids=\"$AWS_ENV_ACCOUNT\" | tee -a $STATE_KEY.dynamic.tfvars
echo build-account-id=\"$BUILD_ACCOUNT_ID\" | tee -a $STATE_KEY.dynamic.tfvars
echo ecr-aws-account-id=\"$AWS_ECR_ACCOUNT\" | tee -a $STATE_KEY.dynamic.tfvars
echo aws-account-id=\"$AWS_ENV_ACCOUNT\" | tee -a $STATE_KEY.dynamic.tfvars
cat  $STATE_KEY.dynamic.tfvars