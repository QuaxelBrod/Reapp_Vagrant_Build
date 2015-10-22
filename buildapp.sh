#!/bin/bash

. /vagrant/environment.sh

# This script should be used by vagrant user
echo "run as $USER"
if [ $USER != "vagrant" ]; then
    exit 1
fi

cd "/home/vagrant/$BUILDDIR"

# copy project files and generate links
echo "############# Copy Project files"
cp -r /vagrant/"$REEAPPDIR"/app .
cp -r /vagrant/"$REEAPPDIR"/assets .

mkdir -p /vagrant/"$REEAPPDIR"/build

echo "############# create build link"
if [ ! -d "build" ]; then
  echo "############# create link to $LNDIR"
  ln -s /vagrant/"$REEAPPDIR"/build build
fi

echo "############# build the webapp"
reapp build