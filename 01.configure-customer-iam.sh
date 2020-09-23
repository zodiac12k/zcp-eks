#!/bin/bash

. ./00.set-env.sh

# Create customer managed permission policies
aws iam create-policy \
--profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} \
--policy-name AmazonEKSFullAccessPolicy \
--policy-document file://AmazonEKSFullAccessPolicy.json \
--description "Provides full access to Amazon EKS (Created by Cloud Z CP)"

# Create assume role policy
cat > AssumeRolePolicy.json <<EOF
{
    "Version": "2012-10-17",
    "Statement": {
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${MANAGED_ACCOUNT_ID}:root"
        },
        "Action": "sts:AssumeRole"
    }
}
EOF

# Create account role
aws iam create-role \
--profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} \
--role-name AWSAccountRoleForCloudZCP \
--assume-role-policy-document file://AssumeRolePolicy.json \
--description "Access to AWS Services and Resources used or managed by Cloud Z CP Account"

# Attach policy to account role
aws iam attach-role-policy --profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} --role-name AWSAccountRoleForCloudZCP --policy-arn arn:aws:iam::aws:policy/IAMFullAccess
aws iam attach-role-policy --profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} --role-name AWSAccountRoleForCloudZCP --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess
aws iam attach-role-policy --profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} --role-name AWSAccountRoleForCloudZCP --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess
aws iam attach-role-policy --profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} --role-name AWSAccountRoleForCloudZCP --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam attach-role-policy --profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} --role-name AWSAccountRoleForCloudZCP --policy-arn arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess
aws iam attach-role-policy --profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} --role-name AWSAccountRoleForCloudZCP --policy-arn arn:aws:iam::aws:policy/AWSCloudFormationFullAccess
aws iam attach-role-policy --profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} --role-name AWSAccountRoleForCloudZCP --policy-arn arn:aws:iam::aws:policy/AWSCertificateManagerFullAccess
aws iam attach-role-policy --profile ${CUSTOMER_ACCOUNT_TEMP_PROFILE} --role-name AWSAccountRoleForCloudZCP --policy-arn arn:aws:iam::${CUSTOMER_ACCOUNT_ID}:policy/AmazonEKSFullAccessPolicy
