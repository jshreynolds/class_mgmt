#! /bin/bash

# usage: mkuser.sh username given_name surname password
# this will create a user in active directory and workspace for them and create a user with the same name in IAM 
# with sufficient permissions to run all of the terraform infra as code

if [ $# -ne 4 ] 
then
    echo "USAGE: mkuser.sh username password given_name surname"
    exit 4
fi

aws workdocs create-user --organization-id d-90677805fe --username $1 --password $2 --given-name $3 --surname $4