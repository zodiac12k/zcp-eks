#!/bin/bash

eksctl create nodegroup \
--region ${REGION} \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--cluster ${CLUSTER_NAME} \
--name logging-4-16 \
--node-type m5.xlarge \
--ssh-access \
--ssh-public-key ${CLUSTER_NAME}-key \
--nodes 3 \
--nodes-min 3 \
--nodes-max 3 \
--node-volume-size 100 \
--node-zones ${ZONES} \
--node-labels "role=logging" \
--node-private-networking \
--managed
