#!/bin/bash

curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-ebs-csi-driver/v0.5.0/docs/example-iam-policy.json

aws iam create-policy \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--policy-name Amazon_EBS_CSI_Driver \
--policy-document file://example-iam-policy.json

IFS=","
for NODE_INSTANCE_ROLE in ${NODE_INSTANCE_ROLES}
do
  aws iam attach-role-policy \
  --profile ${CUSTOMER_ACCOUNT_ALIAS} \
  --role-name ${NODE_INSTANCE_ROLE} \
  --policy-arn arn:aws:iam::${CUSTOMER_ACCOUNT_ID}:policy/Amazon_EBS_CSI_Driver
done
