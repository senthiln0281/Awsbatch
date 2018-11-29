#!/bin/bash

#Clone the repo
git clone https://github.com/senthiln0281/Awsbatch.git

#Pull the repo to get latest updates
git pull --rebase origin 

#List the files

ls -l

cd test/


zip test.zip *.*

scp test.zip test@52.41.92.119:/home/test/test

ssh -t -t test@52.41.92.119 << EOF

cd /home/test/test
yes | sudo unzip test.zip
sudo rm -rf test.zip update.zip
exit
EOF


cd ..
cd update/

zip update.zip *.*

scp update.zip test@52.41.92.119:/home/test/update

ssh -t -t test@52.41.92.119 << EOF

cd /home/test/update
yes | sudo unzip update.zip 
sudo rm -rf update.zip test.zip
exit
EOF

/var/lib/jenkins/workspace/awsclifilemove

#sudo rm -rf FileUpdate FileUpdate@tmp