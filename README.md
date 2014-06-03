# Vagrant Boxes

Packer Templates for building Vagrant boxes.

Boxes are built and released on [Vagrant Cloud](https://vagrantcloud.com/rafacas). 

## Current Boxes

### CentOS

* [rafacas/centos65-plain](https://vagrantcloud.com/rafacas/centos65-plain): CentOS 6.5 (64-bit), Virtualbox.
* [rafacas/centos65-i386-plain](https://vagrantcloud.com/rafacas/centos65-i386-plain): CentOS 6.5 (32-bit), Virtualbox.
* [rafacas/centos64-plain](https://vagrantcloud.com/rafacas/centos64-plain): CentOS 6.4 (64-bit), Virtualbox.
* [rafacas/centos64-i386-plain](https://vagrantcloud.com/rafacas/centos64-i386-plain): CentOS 6.4 (32-bit), Virtualbox.
* [rafacas/centos63-plain](https://vagrantcloud.com/rafacas/centos63-plain): CentOS 6.3 (64-bit), Virtualbox.
* [rafacas/centos63-i386-plain](https://vagrantcloud.com/rafacas/centos63-i386-plain): CentOS 6.3 (32-bit), Virtualbox.
* [rafacas/centos62-plain](https://vagrantcloud.com/rafacas/centos62-plain): CentOS 6.2 (64-bit), Virtualbox.
* [rafacas/centos62-i386-plain](https://vagrantcloud.com/rafacas/centos62-i386-plain): CentOS 6.2 (32-bit), Virtualbox.
* [rafacas/centos61-plain](https://vagrantcloud.com/rafacas/centos61-plain): CentOS 6.1 (64-bit), Virtualbox.
* [rafacas/centos61-i386-plain](https://vagrantcloud.com/rafacas/centos61-i386-plain): CentOS 6.1 (32-bit), Virtualbox.
* [rafacas/centos60-plain](https://vagrantcloud.com/rafacas/centos60-plain): CentOS 6.0 (64-bit), Virtualbox.
* [rafacas/centos60-i386-plain](https://vagrantcloud.com/rafacas/centos60-i386-plain): CentOS 6.0 (32-bit), Virtualbox.
* [rafacas/centos510-plain](https://vagrantcloud.com/rafacas/centos510-plain): CentOS 5.10 (64-bit), Virtualbox.
* [rafacas/centos510-i386-plain](https://vagrantcloud.com/rafacas/centos510-i386-plain): CentOS 5.10 (32-bit), Virtualbox.
* [rafacas/centos59-plain](https://vagrantcloud.com/rafacas/centos59-plain): CentOS 5.9 (64-bit), Virtualbox.
* [rafacas/centos59-i386-plain](https://vagrantcloud.com/rafacas/centos59-i386-plain): CentOS 5.9 (32-bit), Virtualbox.

### Ubuntu

* [rafacas/ubuntu1404-plain](https://vagrantcloud.com/rafacas/ubuntu1404-plain): Ubuntu 14.04 (64-bit), Virtualbox.
* [rafacas/ubuntu1404-i386-plain](https://vagrantcloud.com/rafacas/ubuntu1404-i386-plain): Ubuntu 14.04 (32-bit), Virtualbox.
* [rafacas/ubuntu1204-plain](https://vagrantcloud.com/rafacas/ubuntu1204-plain): Ubuntu 12.04 (64-bit), Virtualbox.
* [rafacas/ubuntu1204-i386-plain](https://vagrantcloud.com/rafacas/ubuntu1204-i386-plain): Ubuntu 12.04 (32-bit), Virtualbox.
* [rafacas/ubuntu1004-plain](https://vagrantcloud.com/rafacas/ubuntu1004-plain): Ubuntu 10.04 (64-bit), Virtualbox.
* [rafacas/ubuntu1004-i386-plain](https://vagrantcloud.com/rafacas/ubuntu1004-i386-plain): Ubuntu 10.04 (32-bit), Virtualbox.

### Fedora

* [rafacas/fedora20-plain](https://vagrantcloud.com/rafacas/fedora20-plain): Fedora 20 (64-bit), Virtualbox.
* [rafacas/fedora20-i386-plain](https://vagrantcloud.com/rafacas/fedora20-i386-plain): Fedora 20 (32-bit), Virtualbox.
* [rafacas/fedora19-plain](https://vagrantcloud.com/rafacas/fedora19-plain): Fedora 19 (64-bit), Virtualbox.
* [rafacas/fedora19-i386-plain](https://vagrantcloud.com/rafacas/fedora19-i386-plain): Fedora 19 (32-bit), Virtualbox.
* [rafacas/fedora18-plain](https://vagrantcloud.com/rafacas/fedora18-plain): Fedora 18 (64-bit), Virtualbox.
* [rafacas/fedora18-i386-plain](https://vagrantcloud.com/rafacas/fedora18-i386-plain): Fedora 18 (32-bit), Virtualbox.

## Usage

Running the following command
```
$ vagrant init rafacas/fedora20-plain
```

would generate the following `Vagrantfile`:
```
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "rafacas/fedora20-plain"
end
```

Now you only have to run:
```
$ vagrant up
```

and the box will be downloaded (the first time only) and the virtual machine will start up.
