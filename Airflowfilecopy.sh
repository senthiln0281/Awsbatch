#!/bin/bash

#Clone the repo
git clone https://gitlab-aid.devops.amgen.com/infosearch/veeva-orchestration/tree/master/cdocs-rdsearch.git

#Pull the repo to get latest updates
git pull --rebase origin 

#List the files

ls -l

#Move into dags directory to zip files

cd cdos-rdsearch/dags/

#Zip the file from above directory

zip dags.zip *.*

#Copy the dags folder files to destination server

scp dags.zip ec2-user@10.204.40.78:/usr/lib/airflow/dags

#SSH into destination server and unzip the files

ssh -t -t ec2-user@10.204.40.78 << EOF
cd /usr/lib/airflow/dags
yes | sudo unzip dags.zip
sleep 20
sudo rm -rf utils.zip
exit
EOF

#Move into utils directory to zip files

cd cdos-rdsearch/utils/

#Zip the file from above directory
zip utils.zip *.*

#Copy the dags folder files to destination server

scp utils.zip ec2-user@10.204.40.78:/home/ec2-user/utils

#SSH into destination server and unzip the files

ssh -t -t ec2-user@10.204.40.78 << EOF
cd /home/ec2-user/utils
yes | sudo unzip utils.zip
sleep 20
sudo rm -rf utils.zip
exit
EOF
