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

## Usage

`Vagrantfile` example:
```
Vagrant.configure('2') do |config|
  config.vm.box = 'rafacas/centos65-plain'
end
```
