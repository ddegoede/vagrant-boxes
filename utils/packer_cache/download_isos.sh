#!/usr/bin/env bash

# Read the isos.txt file and download the ones that have not been
# downloaded yet to the packer_cache directory. After downloading them 
# it creates a symlink with the 'real' name of the ISO to the SHA256 
# name that packer actually uses.
# Ex: 
#  ubuntu-14.04-i386.iso -> cbfadeb20516d3c02c44d71298ff025088f45a14d7d843486803aa520a75da8f.iso

# The isos.txt file has the following format:
# iso_name iso_url
# Ex: 
#  ubuntu-14.04-i386.iso http://releases.ubuntu.com/14.04/ubuntu-14.04-server-i386.iso

while read line; do
    isoname=`echo $line | awk '{print $1}'`
    url=`echo $line | awk '{print $2}'`
    sha256=`echo -n "$url" | shasum -a 256 | awk '{print $1}'`
    # Check if iso file exists
    if [ -f ${sha256}.iso ]; then
        echo "Skipping $isoname download. ${sha256}.iso exists."
        # Check if symlink exists
        if [ ! -L $isoname ]; then
            echo "Creating symlink $isoname -> ${sha256}.iso"
            ln -s ${sha256}.iso $isoname 
        fi
    else
        echo "Downloading $isoname (${url})..."
        wget -O ${sha256}.iso $url
        echo "Creating symlink $isoname..."
        ln -s ${sha256}.iso $isoname
    fi
done < isos.txt
