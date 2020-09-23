#!/bin/bash

. ./00.set-env.sh

eksctl create nodegroup \
--region ${REGION} \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--cluster ${CLUSTER_NAME} \
--name edge-2-4 \
--node-type t3.medium \
--ssh-access \
--ssh-public-key ${CLUSTER_NAME}-key \
--nodes 2 \
--nodes-min 2 \
--nodes-max 2 \
--node-volume-size 100 \
--node-zones ${ZONES} \
--node-labels "dedicated=edge" \
--node-private-networking \
--managed
