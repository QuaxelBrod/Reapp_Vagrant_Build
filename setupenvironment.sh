#!/bin/bash

. /vagrant/environment.sh


# This script should be used by vagrant user
echo "run as $USER"
if [ $USER != "vagrant" ]; then
    exit 1
fi

#update apt
echo "############# apt-update"
sudo apt-get update

#if not installed install curl
echo "############# install curl"
sudo apt-get -y install curl

# Build environment if not available
echo "############# build-essential"
sudo apt-get -y install build-essential

# optional git
#sudo apt-get install -y git

# Install nodejs 4.x from nodejs
echo "############# install node"
# do this as sudo, because node should be global available
# This imports the necessary locations
sudo curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
# and install node
sudo apt-get install --yes nodejs

echo "############# Setting up $BUILDDIR"
if [ ! -d "/home/vagrant/$BUILDDIR" ]; then
  mkdir "/home/vagrant/$BUILDDIR"
fi

cd "/home/vagrant/$BUILDDIR"

# copy project files and generate links
echo "############# Copy Project files"
cp  /vagrant/"$REEAPPDIR"/* .

# setup build link
mkdir -p /vagrant/"$REEAPPDIR"/build

echo "############# create link"
if [ ! -d "build" ]; then
  echo "############# create link to $LNDIR"
  ln -s /vagrant/"$REEAPPDIR"/build build
fi

# install neccessary libs
echo "############# install babel-core"
sudo npm install -g babel-core
echo "############# install reapp"
sudo npm install -g reapp
echo "############# install react"
npm install react
echo "############# install webpack"
npm install webpack
echo "############# install webpack-dev-server"
npm install webpack-dev-server
echo "############# install reapp-kit"
npm install reapp-kit
echo "############# install fbjs"
npm install fbjs

