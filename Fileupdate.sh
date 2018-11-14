#!/bin/bash

export PATH=/home/ec2-user/Awsbatch/.local/bin:$PATH
#git fetch --all
#git merge origin/Awsbatch
#git pull --rebase https://github.com/senthiln0281/Awsbatch.git --verbose
#git pull https://github.com/senthiln0281/Awsbatch.git
git pull --rebase origin 

scp test2.txt senthil@172.31.28.122:/home/senthil
Spam99$$
pwd
ls -l