#!/bin/zsh

set -e

build() {
    apk add --no-cache samba-dc bash ldb-tools

    smbstatus | grep version

    cat /root/smb.conf > /etc/samba/smb.conf

    rm -f /root/build.sh
    rm -f /root/smb.conf
}

build