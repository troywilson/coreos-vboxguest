#!/bin/bash

set -x
ROOT_OS_RELEASE="${ROOT_OS_RELEASE:-/root/etc/os-release}"
ROOT_MOUNT_DIR="${ROOT_MOUNT_DIR:-/root}"

KERNEL_VERSION=$(uname -r)

if [[ ! -f "${ROOT_OS_RELEASE}" ]]; then
  error "File ${ROOT_OS_RELEASE} not found, /etc/os-release must be mounted into this container."
  exit 1
fi
. "${ROOT_OS_RELEASE}"

VBOX_DIR="/opt/vboxguest"
INSTALL_DIR="${VBOX_DIR}/coreos-${VERSION}"

if [[ ! -d "${INSTALL_DIR}" ]]; then
  cd /tmp
  curl -L https://github.com/troywilson/coreos-vboxguest-builder/releases/download/${VERSION}/vboxguest.tar.gz -o vboxguest.tar.gz
  tar -C . -xf vboxguest.tar.gz
  VBOX_VERSION=`cat /tmp/vboxguest/version.txt`
  rm -rf "${VBOX_DIR}"
  mkdir -p "${INSTALL_DIR}"
  cp /tmp/vboxguest/src/vboxguest-${VBOX_VERSION}/*.ko "${INSTALL_DIR}/"
  cp /tmp/vboxguest/other/mount.vboxsf "${INSTALL_DIR}/mount.vboxsf"
  cp /tmp/vboxguest/sbin/VBoxService "${INSTALL_DIR}/VBoxService"
  rm -rf /tmp/*
fi

if ! lsmod | grep -qw 'vboxguest'; then
  insmod "${INSTALL_DIR}/vboxguest.ko" 2> /dev/null
fi

if ! lsmod | grep -qw 'vboxsf'; then
  insmod "${INSTALL_DIR}/vboxsf.ko" 2> /dev/null
fi

if ! lsmod | grep -qw 'vboxvideo'; then
  insmod "${INSTALL_DIR}/vboxvideo.ko" 2> /dev/null
fi

eval "${INSTALL_DIR}/VBoxService -f"
