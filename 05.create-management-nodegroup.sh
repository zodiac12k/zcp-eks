#!/bin/bash

. ./00.set-env.sh

eksctl create nodegroup \
--region ${REGION} \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--cluster ${CLUSTER_NAME} \
--name mgmt-8-16 \
--node-type c5.2xlarge \
--ssh-access \
--ssh-public-key ${CLUSTER_NAME}-key \
--nodes 2 \
--nodes-min 2 \
--nodes-max 2 \
--node-volume-size 100 \
--node-zones ${ZONES} \
--node-labels "role=management" \
--node-private-networking \
--managed
