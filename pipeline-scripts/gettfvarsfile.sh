#!/bin/bash
BASE="$PWD/Terraform/prod-env"
if [ "$1" == "master" ]; then
 echo "$BASE/prod.tfvars"
 else
 echo "$BASE/$1.tfvars"
fi