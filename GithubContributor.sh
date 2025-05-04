#!/bin/bash

#################################
#
#
#	Author: Harnoor
#	Purpose: This is used to
#		fetch github 
#		contributor list
#################################
# Params - repository org/user
# Params - repository Name
# env variable - token
# env variable - user profile
# Helper function
################################
# DEBUG MODE
#set -exo pipefail
################################

#helper()

API_BASE_URL=https://api.github.com

#Format - Baseurl/repos/ORG/REPO/collaborators

# Fetching Environment Variables
TOKEN=$token
USER=$GIT_USERNAME

# Fetching Arguments
OWNER=$1
REPO=$2
include_admins=${3:-'false'}
#echo $include_admins
url="$API_BASE_URL/repos/$OWNER/$REPO/collaborators"

function base_caller(){

#echo "TOKEN is $TOKEN \n URL is $url"
response=`curl -sS --fail -L -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" $url`

if (( $?  == 0));then
	echo "collaborators are listed below for $OWNER/$REPO"
	if [ $include_admins = "false" ];then
		echo $response | jq -r '.[] | select(.permissions.admin == false) .login'
	else
		echo $response | jq '.[].login'
	fi;
else
	echo "error occured"
fi;


}

function helper(){
#write helper for args
#echo "hellow"
if [ $1 -lt 2 ];
then
	echo "Positional params provided : $1"
	echo "provide parameters for Owner and repository"
	echo "[optional] proide parameter to include admins"
fi;
}
helper $#
base_caller

