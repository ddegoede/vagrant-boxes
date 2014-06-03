#!/bin/bash -eux

echo "Configuring sshd_config options"

# Turning off sshd DNS lookup to prevent timeout delay
echo "UseDNS no" >> /etc/ssh/sshd_config

# Disabling GSSAPI authentication to prevent timeout delay
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
