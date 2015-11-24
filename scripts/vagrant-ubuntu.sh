#!/usr/bin/env bash
set -x

mkdir /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys 'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub'
mv authorized_keys /home/vagrant/.ssh
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh

# need vagrant having passwdless sudo
# @ToDo - tidy this up.

echo "vagrant ALL=(ALL) NOPASSWD:ALL
Defaults:vagrant !requiretty" \
> /etc/sudoers.d/vagrant

aptitude update
aptitude upgrade -y
aptitude install -y net-tools bind-utils nfs-common portmap rpcbind libgssglue nfs-utils keyutils libevent nfs-utils-lib

aptitude -y autoclean