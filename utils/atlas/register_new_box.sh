#!/usr/bin/env bash

# Script that registers a new Vagrant box in Atlas (https://atlas.hashicorp.com/)

if [ $# -ne 1 ]; then
    echo "Usage $0 <box file>"
    echo "  Ex: $0 ../../boxes/debian-7.8-i386-plain-1.0.0.box"
    exit 1
fi

BOX=$1
BOX_FILE=`basename $BOX`
BOX_DIR=`dirname $BOX`

IFS='-' read -ra FIELDS <<< "$BOX_FILE"
if [[ ${#FIELDS[@]} -ne 5 ]]; then
    echo "The box filename should have the following format:"
    echo "<distro_name>-<distro_version>-<arch>-plain-<box_version>.box"
    echo "  Ex: debian-7.8-i386-plain-1.0.0.box"
    exit 1
fi
DISTRO_NAME=${FIELDS[0]}
DISTRO_VERSION=${FIELDS[1]}
ARCH=${FIELDS[2]}
BOX_VERSION=${FIELDS[4]%.*x} #Strip ".box" suffix off filename
PROVIDER="virtualbox"
# BOX_NAME has the following format:
# 32-bit: <distro_name><distro_version_without_dots>-i386-plain
#     ex: debian78-i386-plain
# 64-bit: <distro_name><distro_version_without_dots>-plain
#     ex: debian78-plain
if [[ "$ARCH" = i386 ]]; then
    ARCH_STR="-i386"
    ARCH_DESC="32-bit"
else
    ARCH_STR=""
    ARCH_DESC="64-bit"
fi
BOX_NAME=${DISTRO_NAME}${DISTRO_VERSION//./}${ARCH_STR}-plain
ATLAS_URI="https://atlas.hashicorp.com/api/v1/box/${ATLAS_USERNAME}"
TMP_DIR=tmp
mkdir -p $TMP_DIR
TMP_FILE=${TMP_DIR}/atlas.tmp

### FUNCTIONS ###
function debug {
    echo "Distro version: $DISTRO_VERSION"
    echo "Arch: $ARCH"
    echo "Arch str: $ARCH_STR"
    echo "Arch desc: $ARCH_DESC"
    echo "Box version: $BOX_VERSION"
    echo "Box name: $BOX_NAME"
}

function print_tmp {
    echo "tmp: `cat ${TMP_FILE}`"
}

function get_box {
    curl ${ATLAS_URI}/${BOX_NAME}?${ATLAS_TOKEN} \
        -X GET \
        -o "${TMP_FILE}" 2> /dev/null > "${TMP_FILE}"
}

function create_box {
    box_shortdesc="A standard ${DISTRO_NAME_UP} ${DISTRO_VERSION} (${ARCH_DESC}) box."
    box_desc="A standard ${DISTRO_NAME_UP} ${DISTRO_VERSION} (${ARCH_DESC}) box. Source can be found on Github: [https://github.com/rafacas/vagrant-boxes](https://github.com/rafacas/vagrant-boxes)"
    curl -X POST https://atlas.hashicorp.com/api/v1/boxes \
        -d box[name]="${BOX_NAME}" \
        -d box[short_description]="$box_shortdesc" \
        -d box[description]="$box_desc" \
        -d box[is_private]="false" \
        -d access_token="${ATLAS_TOKEN}" \
        -o ${TMP_FILE} 2>/dev/null
    print_tmp
}

function create_version {
    virtualbox_version=`virtualbox --help | head -n1 | awk '{print $NF}'`
    file_size=`du -kh ${BOX} | cut -f1`
    version_desc="${DISTRO_NAME_UP} ${DISTRO_VERSION} (${ARCH_DESC})
  * VBoxGuestAdditions $virtualbox_version
  * $file_size"
    curl -X POST ${ATLAS_URI}/${BOX_NAME}/versions \
        -d version[version]="${BOX_VERSION}" \
        -d version[description]="$version_desc" \
        -d access_token="${ATLAS_TOKEN}" \
        -o "${TMP_FILE}" 2>/dev/null
    print_tmp
}

function create_provider {
    url=http://vagrant-boxes.rafacas.net/${BOX_FILE}
    curl -X POST ${ATLAS_URI}/${BOX_NAME}/version/${BOX_VERSION}/providers \
        -d provider[name]="${PROVIDER}" \
        -d provider[url]="$url" \
        -d access_token="${ATLAS_TOKEN}" \
        -o "${TMP_FILE}" 2>/dev/null
    print_tmp
}

function release_version {
    curl -X PUT ${ATLAS_URI}/${BOX_NAME}/version/${BOX_VERSION}/release \
        -d access_token="${ATLAS_TOKEN}" \
        -o "${TMP_FILE}" 2>/dev/null
    print_tmp
}

### MAIN ###
echo "Checking for existing box..."
get_box
existing_box=`jq .errors[] 2>/dev/null < ${TMP_FILE}`
echo "existing_box: $existing_box"
if [[ $existing_box =~ "not found" ]]; then
    echo "Box ${BOX_NAME} doesn't exist: $existing_box"
    echo "Creating box ${BOX_NAME}..."
    create_box
else
    echo "Box ${BOX_NAME} exists"
fi

echo "Cheking for version ${BOX_VERSION}..."
existing_version=`jq -r ".versions[] | select(.version == \"${BOX_VERSION}\") | .version" 2>/dev/null < ${TMP_FILE}`
if [ ! -z "${existing_version}" ]; then
    echo "Version ${BOX_VERSION} already exists."
    exit 1
else
    echo "Version ${BOX_VERSION} doesn't exist"
fi

echo "Creating version ${BOX_VERSION}..."
DISTRO_NAME_UP="$(tr '[:lower:]' '[:upper:]' <<< ${DISTRO_NAME:0:1})${DISTRO_NAME:1}" 
create_version

echo "Creating provider ${PROVIDER}..."
create_provider

echo "Releasing version..."
release_version
