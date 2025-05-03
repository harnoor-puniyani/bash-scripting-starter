#!/bin/bash
#
############################################################
# Author - Noor
##This is used to fetch the data from multiple given clouds
##############################################################

set -x

#list storage account in azure
az storage account list | jq '.[].name'

#list azure users 
az ad user list | jq '.[].userPrincipalName'

#list s3 buckets in aws
 aws s3 ls | awk -F" " '{print $3}'

#list aws users
aws iam list-users | jq '.Users[].UserName'

