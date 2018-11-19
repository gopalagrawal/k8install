#!/bin/sh

if [[ $# -lt 2 ]] ; then
    echo 'Usage: <cmd>    <release (eg., bionic)>    <dockerversion (eg.,18.03.1~ce-0~ubuntu)>
    exit 0
fi


release=$1
dockerversion=$2

echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $release stable" | sudo tee -a /etc/apt/sources.list.d/docker.list

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sleep 1
sudo apt-get update

sleep 3
sudo apt-get install docker-ce=$dockerversion

