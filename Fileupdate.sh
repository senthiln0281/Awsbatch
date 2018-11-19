#!/bin/bash

#Clone the repo
#git clone https://github.com/senthiln0281/Awsbatch.git

git clone -branch Fileupdate https://github.com/senthiln0281/Awsbatch.git

#Pull the repo to get latest updates
git pull --rebase origin 

#List the files

ls -l

#rm -f *

#Create .ssh directory to save destination server credentials
#mkdir .ssh

#Create private keyfile

#touch id_rsa

#Copy the files from jenkins server to remote server

scp Fileupdate.sh ec2-user@10.0.19.82:/home/ec2-user/test

cd /var/lib/jenkins/workspace/FileUpdate

rm -f *







