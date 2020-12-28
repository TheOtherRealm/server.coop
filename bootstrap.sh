#!/usr/bin/env bash
add-apt-repository ppa:ondrej/apache2
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y apache2
apt-get install -y php
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi