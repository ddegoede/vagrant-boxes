#!/usr/bin/env bash

for box in `vagrant box list | awk -F' ' '{print $1}'`; do vagrant box remove $box; done
