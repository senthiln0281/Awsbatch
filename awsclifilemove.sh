#!/bin/bash
#Clone the repo
git clone https://github.com/senthiln0281/Awsbatch.git

#Pull the repo to get latest updates
git pull --rebase origin 

#List the files

ls -l

#Move into dags directory to zip files

cd update/

ls -l

#Zip the file from above directory

zip update.zip *.*


~/.local/bin/aws --version

#Create temp S3 bucket

aws s3 mb s3://4977041 --region us-west-2

#Copy the files to S3

aws s3 cp Awsbatch.zip s3://4977041/update.zip




cd /tmp
mv Awsbatch Awsbatch$(date "+%Y-%m-%dT%H:%M:%S%:z")

#Clone the repo
git clone https://github.com/senthiln0281/Awsbatch.git

cd /root/test
mv utils utils$(date "+%Y-%m-%dT%H:%M:%S%:z")

cd /tmp/Awsbatch/Fileupdate
#mv utils utils$(date "+%Y-%m-%dT%H:%M:%S%:z")

mv *.py utils /root/test


cd /tmp
mv Awsbatch Awsbatch$(date "+%Y-%m-%dT%H:%M:%S%:z")

#Clone the repo
git clone https://github.com/senthiln0281/Awsbatch.git

cd /home/test/test
mv utils utils$(date "+%Y-%m-%dT%H:%M:%S%:z")

cd /tmp/Awsbatch/Fileupdate
#mv utils utils$(date "+%Y-%m-%dT%H:%M:%S%:z")

mv *.py utils /home/test/test




