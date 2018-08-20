#!/bin/bash -v
sudo apt-get update 
sudo apt-get install git -y 
sudo apt-get install python -y 
sudo apt-get install python-setuptools -y 
sudo apt-get install python-openssl -y 
sudo apt-get install docker-compose -y 

# install docker engine
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce -y

# Launch CloudLens container
sudo docker pull ixiacom/cloudlens-sandbox-agent 
sudo docker run -v /:/host -v /var/run/docker.sock:/var/run/docker.sock --privileged --name cloudlens-agent -d --restart=on-failure --net=host ixiacom/cloudlens-sandbox-agent --accept_eula yes --apikey $1

# Install Suricata
sudo git clone https://github.com/StamusNetworks/Amsterdam.git 
cd Amsterdam 
sudo python setup.py install 
sudo amsterdam -d ams -i cloudlens0 setup 
sudo amsterdam -d ams start 
