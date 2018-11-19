#!/bin/sh

#------------------------------------------------------------
#You will install these packages on all of your machines:
#
#kubeadm: the command to bootstrap the cluster.
#
#kubelet: the component that runs on all of the machines in your cluster and does things like starting pods and containers.
#
#kubectl: the command line util to talk to your cluster.
#------------------------------------------------------------


sudo apt-get update && sudo apt-get install -y apt-transport-https curl
sleep 3

wget --no-check-certificate  https://packages.cloud.google.com/apt/doc/apt-key.gpg
sudo apt-key add apt-key.gpg

#Make it ignore certificate verification of google cloud pkgs
echo "Acquire::https::packages.cloud.google.com::Verify-Peer "false";" | sudo tee --append /etc/apt/apt.conf

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee --append /etc/apt/sources.list.d/kubernetes.list

sleep 3
sudo apt-get update

sleep 3
sudo apt-get install -y kubelet kubeadm kubectl

sleep 3
sudo apt-mark hold kubelet kubeadm kubectl


