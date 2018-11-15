#!/bin/bash

#Clone the repo
git clone https://github.com/senthiln0281/Awsbatch.git

#Pull the repo to get latest updates
git pull --rebase origin 

#Copy the files from jenkins server to remote server

scp test2.txt ec2-user@ 10.0.19.82:/home/ec2-user
#ssh 
#wget https://raw.githubusercontent.com/senthiln0281/Awsbatch/master/awsbatch.tf
pwd
ls -l