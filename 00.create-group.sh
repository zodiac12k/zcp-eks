#!/bin/bash

aws iam create-group --profile ${MANAGED_ACCOUNT_PROFILE} --group-name cloudzcp-admin
