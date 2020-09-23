#!/bin/bash

. ./00.set-env.sh

cat > AssumeRolePolicy-${CUSTOMER_ACCOUNT_ALIAS}.json <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::${CUSTOMER_ACCOUNT_ID}:role/AWSAccountRoleForCloudZCP"
        }
    ]
}
EOF

aws iam create-policy \
--profile ${MANAGED_ACCOUNT_PROFILE} \
--policy-name AssumeRolePolicy-${CUSTOMER_ACCOUNT_ALIAS} \
--policy-document file://AssumeRolePolicy-${CUSTOMER_ACCOUNT_ALIAS}.json \
--description "Provides access to Cloud Z CP for ${CUSTOMER_ACCOUNT_ALIAS} Customer (Created by Cloud Z CP)"

aws iam attach-group-policy \
--profile ${MANAGED_ACCOUNT_PROFILE} \
--group-name cloudzcp-admin \
--policy-arn arn:aws:iam::${MANAGED_ACCOUNT_ID}:policy/AssumeRolePolicy-${CUSTOMER_ACCOUNT_ALIAS}
