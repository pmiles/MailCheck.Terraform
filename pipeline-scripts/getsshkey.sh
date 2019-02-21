#!/bin/bash

mkdir -p ~/.ssh
aws ssm get-parameter --name $PRIVATE_REPO_SSH_KEY --with-decryption --region $AWS_REGION > ~/.ssh/parameter-store-output
cat ~/.ssh/parameter-store-output | jq -r '.Parameter.Value' | sed -E -e 's/[[:blank:]]+/\n/g' | base64 -d - > ~/.ssh/id_rsa
RESULT=`ssh-keygen -l -f ~/.ssh/id_rsa | grep "is not a"`
if [ -z "$RESULT" ]; then
    echo "NO KEY FOUND!"
    cat ~/.ssh/parameter-store-output
    exit 1
fi
chmod 600 ~/.ssh/id_rsa