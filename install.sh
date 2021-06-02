#!/bin/zsh

set -e

install() {
    # add samba
    apk add --no-cache samba-dc bash ldb-tools

    # verify samba version
    smbstatus | grep version

    # Add `ldap server require strong auth = no` setting to the conf
    cat /root/smb.conf > /etc/samba/smb.conf
}

install