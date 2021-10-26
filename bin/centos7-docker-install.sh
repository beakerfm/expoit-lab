#!/usr/bin/bash

# Install docker
sudo yum check-update
curl -fsSL https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

# Install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Install git
sudo yum install git -y

# Disable Selinux
#TODO reduce disable to allow specific permissinos for nginx
sudo setenforce Permissive

# Enable ipv4 forwarding
sudo echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
sudo systemctl restart network
sudo systemctl restart docker
