#!/bin/bash

export CUSTOMER_ACCOUNT_ID=213046452187
export CUSTOMER_ACCOUNT_ALIAS=skt-tds
export CUSTOMER_TEMP_IAM_USERNAME=zodiac12k
export CUSTOMER_ACCOUNT_TEMP_PROFILE=${CUSTOMER_ACCOUNT_ALIAS}-${CUSTOMER_TEMP_IAM_USERNAME}

export MANAGED_ACCOUNT_ID=600697919798
export MANAGED_ACCOUNT_ALIAS=zcp-prod
export MANAGED_IAM_USERNAME=zodiac12k
export MANAGED_ACCOUNT_PROFILE=${MANAGED_ACCOUNT_ALIAS}-${MANAGED_IAM_USERNAME}

export CLUSTER_NAME=cloudzcp-skt-tds-dev
export K8S_VERSION=1.17
export REGION=ap-northeast-2
export ZONES=ap-northeast-2a,ap-northeast-2c
export VPC_CIDR=10.0.0.0/16
export VPC_ID=vpc-0920452635cce1662
export PRIVATE_SUBNET_IDS=subnet-08dd093dae4ae238f,subnet-05db26d774adb8938
export ROUTE_TABLE_IDS=("\"rtb-0083af43b13a5d9c0\"" "\"rtb-0e0abf0173b060020\"")
export NODE_INSTANCE_ROLES=eksctl-cloudzcp-sre-prod-nodegrou-NodeInstanceRole-1ALP5QMI40VX7,eksctl-cloudzcp-sre-prod-nodegrou-NodeInstanceRole-B02T9H3A79YM,eksctl-cloudzcp-sre-prod-nodegrou-NodeInstanceRole-SEKSBMGZIXUN,eksctl-cloudzcp-sre-prod-nodegrou-NodeInstanceRole-868EDW40VTZW
