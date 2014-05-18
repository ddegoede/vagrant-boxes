echo "packer builder type: $PACKER_BUILDER_TYPE"
if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    # Assume that we've installed all the prerequisites:
    # kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
    # from the install media via ks.cfg

    VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
    echo "Vbox version: $VBOX_VERSION"
    mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
    echo "mount VBoxGuestAdditions_$VBOX_VERSION"
    sh /mnt/VBoxLinuxAdditions.run --nox11
    echo "Install VBoxLinuxAdditions"
    umount /mnt
    echo "umount..."
    rm -rf /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso

    if [[ $VBOX_VERSION = "4.3.10" ]]; then
        ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
    fi
fi

# Removing packages needed for building guest tools
yum -y remove gcc cpp kernel-devel kernel-headers perl
