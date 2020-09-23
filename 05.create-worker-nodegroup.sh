#!/bin/bash

eksctl create nodegroup \
--region ${REGION} \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--cluster ${CLUSTER_NAME} \
--name zcp-4-16 \
--node-type m5.xlarge \
--ssh-access \
--ssh-public-key ${CLUSTER_NAME}-key \
--nodes 1 \
--nodes-min 1 \
--nodes-max 1 \
--node-volume-size 100 \
--node-zones ${ZONES} \
--node-private-networking \
--managed
