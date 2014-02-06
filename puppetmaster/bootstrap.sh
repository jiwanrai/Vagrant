#!/bin/bash

HOSTNAME="puppet.dalia.internal"

apt-get update
apt-get upgrade -y
apt-get install -y puppetmaster
hostname $HOSTNAME

# Add test hosts to hosts file.
if [ 'cat /etc/hosts | grep puppet']; then
  echo "10.10.10.10 puppet" >> /etc/hosts
  echo "10.10.10.11 webdev001.dalia.internal" >> /etc/hosts
  echo "10.10.10.12 webdev002.dalia.internal" >> /etc/hosts
fi

# Create Symlinks to shared puppet folder
if [ -d /puppet ]; then
  if [ -d /etc/puppet/manifests ]; then
     rm -rf /etc/puppet/manifests
     ln -s /puppet/manifests/ /etc/puppet/manifests
  fi
  if [ -d /etc/puppet/modules ]; then
     rm -rf /etc/puppet/modules
     ln -s /puppet/modules/ /etc/puppet/modules
  fi
fi
