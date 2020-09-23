#!/bin/bash

. ./00.set-env.sh

eksctl create cluster \
--name ${CLUSTER_NAME} \
--version ${K8S_VERSION} \
--region ${REGION} \
--profile ${CUSTOMER_ACCOUNT_ALIAS} \
--zones ${ZONES} \
--asg-access \
--full-ecr-access \
--without-nodegroup \
--vpc-cidr ${VPC_CIDR} \
--vpc-nat-mode HighlyAvailable \
--managed
