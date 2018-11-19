#!/bin/bash

#Clone the repo
git clone https://github.com/senthiln0281/Awsbatch.git

#Pull the repo to get latest updates
git pull --rebase origin 

#List the files

ls -l

cd test/


zip test.zip *.*

scp test.zip ec2-user@10.0.19.82:/home/ec2-user/test

ssh -t -t ec2-user@10.0.19.82 << EOF
echo $HOSTNAME
cd /home/ec2-user/test
yes | sudo unzip test.zip
exit
EOF

cd update/


zip update.zip *.*

scp update.zip ec2-user@10.0.19.82:/home/ec2-user/update

ssh -t -t ec2-user@10.0.19.82 << EOF
echo $HOSTNAME
cd /home/ec2-user/update
yes | sudo unzip update.zip
exit
EOF