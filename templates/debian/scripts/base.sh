#!/bin/bash -eux

echo "Disabling CDROM entries to avoid prompts to insert a disk"
sed -i "/^deb cdrom:/s/^/#/" /etc/apt/sources.list

apt-get -y update
apt-get -y install curl expect
/usr/bin/expect -c 'expect "quit)" { eval spawn apt-get -y install wget; send "q\n" }'
apt-get clean
