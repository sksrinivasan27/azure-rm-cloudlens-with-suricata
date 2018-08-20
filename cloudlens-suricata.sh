#!/bin/bash -v
sudo apt-get update 
sudo apt-get install git -y 
sudo apt-get install python -y 
sudo apt-get install python-setuptools -y 
sudo apt-get install python-openssl -y 
sudo apt-get install docker-compose -y 
sudo apt-get install -y docker.io 
sudo docker pull ixiacom/cloudlens-sandbox-agent 
sudo docker run -v /:/host -v /var/run/docker.sock:/var/run/docker.sock --privileged --name cloudlens-agent -d --restart=on-failure --net=host ixiacom/cloudlens-sandbox-agent --accept_eula yes --apikey s1CUSM61Wny4G8u6sRUztH4T7N0h76o0853OLPUtO
sudo git clone https://github.com/StamusNetworks/Amsterdam.git 
cd Amsterdam 
sudo python setup.py install 
sudo amsterdam -d ams -i cloudlens0 setup 
sudo amsterdam -d ams start 
