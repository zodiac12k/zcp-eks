#!/bin/bash

. ./00.set-env.sh

#aws s3api create-bucket \
#--profile ${CUSTOMER_ACCOUNT_ALIAS} \
#--region ${REGION} \
#--bucket ${CLUSTER_NAME}-registry \
#--create-bucket-configuration LocationConstraint=${REGION}
echo ${ROUTE_TABLE_IDS}

echo  "${ROUTE_TABLE_IDS[*]}"

aws ec2 create-vpc-endpoint \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--region ${REGION} \
--vpc-endpoint-type Gateway \
--vpc-id ${VPC_ID} \
--service-name com.amazonaws.ap-northeast-2.s3 \
--route-table-ids ${ROUTE_TABLE_IDS[*]}
