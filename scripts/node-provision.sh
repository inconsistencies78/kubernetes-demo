#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

# Konfiguration der Namensauflösung
systemctl disable --now systemd-resolved
rm /etc/resolv.conf
echo "nameserver 192.168.100.2" > /etc/resolv.conf
cp /vagrant/config/hosts /etc/hosts

# Docker-Installation
apt-get -y install docker.io
systemctl enable --now docker

# Kubernetes
swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
apt-get -y install software-properties-common apt-transport-https curl 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main"

