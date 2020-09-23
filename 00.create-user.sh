#!/bin/bash

aws iam create-user \
--profile ${MANAGED_ACCOUNT_PROFILE} \
--user-name ${MANAGED_ACCOUNT_USERNAME}

aws iam add-user-to-group \
--profile ${MANAGED_ACCOUNT_PROFILE} \
--group-name cloudzcp-admin \
--user-name ${MANAGED_ACCOUNT_USERNAME}

aws iam create-access-key \
--profile ${MANAGED_ACCOUNT_PROFILE} \
--user-name ${MANAGED_ACCOUNT_USERNAME}

aws iam attach-user-policy \
--profile ${MANAGED_ACCOUNT_PROFILE} \
--user-name ${MANAGED_ACCOUNT_USERNAME} \
--policy-arn arn:aws:iam::aws:policy/IAMUserChangePassword
