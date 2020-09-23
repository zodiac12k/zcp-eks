#!/bin/bash

aws configure set profile.${CUSTOMER_ACCOUNT_ALIAS}.role_arn arn:aws:iam::${CUSTOMER_ACCOUNT_ID}:role/AWSAccountRoleForCloudZCP
aws configure set profile.${CUSTOMER_ACCOUNT_ALIAS}.source_profile ${MANAGED_ACCOUNT_PROFILE}
aws configure set profile.${CUSTOMER_ACCOUNT_ALIAS}.output json
aws configure set profile.${CUSTOMER_ACCOUNT_ALIAS}.cli_pager ""
