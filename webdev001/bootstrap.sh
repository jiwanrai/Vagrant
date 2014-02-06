#!/bin/bash

HOSTNAME="webdev001.dalia.internal"

apt-get update
apt-get upgrade -y
apt-get install -y puppet
hostname $HOSTNAME

# Add test hosts to hosts file.
if [ ! 'cat /etc/hosts | grep puppet' ]; then
  echo "10.10.10.10 puppet" >> /etc/hosts
  echo "10.10.10.11 webdev001.dalia.internal" >> /etc/hosts
  echo "10.10.10.12 webdev002.dalia.internal" >> /etc/hosts
fi


