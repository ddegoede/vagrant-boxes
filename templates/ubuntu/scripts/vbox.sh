if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    echo "Installing VirtualBox guest additions"

    apt-get install -y linux-headers-$(uname -r) build-essential perl
    apt-get install -y dkms

    VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
    mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run
    umount /mnt
    rm /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso

    if [[ $VBOX_VERSION = "4.3.18" ]]; then
        ln -s /opt/VBoxGuestAdditions-4.3.18/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
    fi
fi
