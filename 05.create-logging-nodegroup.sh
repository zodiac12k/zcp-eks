#!/bin/bash

. ./00.set-env.sh

eksctl create nodegroup \
--region ${REGION} \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--cluster ${CLUSTER_NAME} \
--name logging-4-16 \
--node-type m5.xlarge \
--ssh-access \
--ssh-public-key ${CLUSTER_NAME}-key \
--nodes 1 \
--nodes-min 1 \
--nodes-max 1 \
--node-volume-size 100 \
--node-zones ap-northeast-2a \
--node-labels "role=logging" \
--node-private-networking \
--managed
