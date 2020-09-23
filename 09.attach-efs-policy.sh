#!/bin/bash

IFS=","
for NODE_INSTANCE_ROLE in ${NODE_INSTANCE_ROLES}
do
  aws iam attach-role-policy \
  --profile ${CUSTOMER_ACCOUNT_ALIAS} \
  --role-name ${NODE_INSTANCE_ROLE} \
  --policy-arn arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess
done
