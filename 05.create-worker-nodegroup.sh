#!/bin/bash

. ./00.set-env.sh

eksctl create nodegroup \
--region ${REGION} \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--cluster ${CLUSTER_NAME} \
--name zcp-8-16 \
--node-type c5.2xlarge \
--ssh-access \
--ssh-public-key ${CLUSTER_NAME}-key \
--nodes 3 \
--nodes-min 3 \
--nodes-max 3 \
--node-volume-size 100 \
--node-zones ${ZONES} \
--node-private-networking \
--managed
