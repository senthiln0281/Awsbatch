#!/bin/bash

#Clone the repo
#git clone https://github.com/senthiln0281/Awsbatch.git

wget https://github.com/senthiln0281/Awsbatch/tree/master/Fileupdate

#git clone -branch Fileupdate https://github.com/senthiln0281/Awsbatch.git

#Pull the repo to get latest updates
#git pull --rebase origin 

#List the files

ls -l

zip test.zip *.*

ls -l

#rm -f *

#Create .ssh directory to save destination server credentials
#mkdir .ssh

#Create private keyfile

#touch id_rsa

#Copy the files from jenkins server to remote server

#scp Fileupdatetest.sh ec2-user@10.0.19.82:/home/ec2-user/test


#scp -r ec2-user@10.0.19.82:/home/ec2-user/test

pwd

scp test.zip ec2-user@10.0.19.82:/home/ec2-user/test

ssh ec2-user@10.0.19.82 
cd /home/ec2-user/test | yes | sudo unzip test.zip

#yes | unzip fileupdate.zip



#cd /var/lib/jenkins/workspace/FileUpdate

#rm -f *

#git clone -branch test https://github.com/senthiln0281/Awsbatch.git

#git pull --rebase origin

#ls -l


#scp as.txt ec2-user@10.0.19.82:/home/ec2-user/test1


