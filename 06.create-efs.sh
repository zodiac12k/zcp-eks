#!/bin/bash

. ./00.set-env.sh

SECURITY_GROUP_ID=$(aws ec2 create-security-group \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--region ${REGION} \
--vpc-id ${VPC_ID} \
--group-name ${CLUSTER_NAME}-efs-sg \
--description "EFS Security group for ${CLUSTER_NAME} cluster." | jq -r '.GroupId')

echo "${SECURITY_GROUP_ID} has been created"

aws ec2 authorize-security-group-ingress \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--region ${REGION} \
--group-id ${SECURITY_GROUP_ID} \
--protocol tcp \
--port 2049 \
--cidr 0.0.0.0/0

FILE_SYSTEM_ID=$(aws efs create-file-system \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--region ${REGION} \
--tags Key=Name,Value=${CLUSTER_NAME} | jq -r '.FileSystemId')

echo "${FILE_SYSTEM_ID} has been created"

sleep 60

IFS=","
for PRIVATE_SUBNET_ID in ${PRIVATE_SUBNET_IDS}
do
  aws efs create-mount-target \
  --profile ${CUSTOMER_ACCOUNT_ALIAS} \
  --region ${REGION} \
  --file-system-id ${FILE_SYSTEM_ID} \
  --subnet-id ${PRIVATE_SUBNET_ID} \
  --security-group ${SECURITY_GROUP_ID}
done
