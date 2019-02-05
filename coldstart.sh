#!/bin/bash


echo "#### coldstart.sh has started."

echo "INFO: Removing the folder '~/docker-build-beats'"
cd ~
rm -rf ~/docker-build-beats

echo "INFO: Cloning docker-build-beats"
git clone https://github.com/sejnub/docker-build-beats.git
cd docker-build-beats
chmod ug+x build.sh

echo "INFO: docker run build.sh"
docker run \
  --rm     \
  -v `pwd`/bin:/build \
  -v `pwd`/build.sh:/run/build.sh \
  golang:latest \
  /run/build.sh


echo
echo "INFO: Cheking results with the command 'file':"
file ~/docker-build-beats/bin/filebeat 
file ~/docker-build-beats/bin/metricbeat 
file ~/docker-build-beats/bin/heartbeat 

cd ~

#echo
#echo "Warning: Now you should do the following to pus the newly created executables:"
#echo
#echo "cd ~/docker-build-beats"
#echo "git status"
#echo "git add ."
#echo "git commit -m 'Added the freshly compiled beats'"
#echo "git push"
#echo

echo "#### coldstart.sh has ended."
