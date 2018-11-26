#!/bin/bash
#Clone the repo
git clone https://gitlab-aid.devops.amgen.com/infosearch/veeva-orchestration.git

#Pull the repo to get latest updates
git pull --rebase origin 

#List the files

ls -l

#Move into dags directory to zip files

cd awsbatch/

#Zip the file from above directory

zip awsbatch.zip *.*

#Create temp S3 bucket

aws s3api create-bucket --bucket 4977041 --region us-west-2

#Copy the files to S3

aws s3 cp awsbatch.zip s3://4977041/awsbatch.zip



