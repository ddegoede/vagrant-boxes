#!/usr/bin/env bash

IFS=$'\n'; for i in $(vagrant box list); do box=`echo $i | awk -F' ' '{print $1}'`; ver=`echo $i | awk -F' ' '{print $3}' | tr -d ')'`; vagrant box remove $box --box-version $ver; done
