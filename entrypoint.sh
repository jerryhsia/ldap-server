#!/bin/zsh

set -e

init() {
    samba-tool domain provision --server-role=dc --use-rfc2307 --dns-backend=SAMBA_INTERNAL --realm=test.com --domain=ldap --adminpass=Passw0rd

    for i in $( seq 1 2 )
    do
        samba-tool ou create "OU=test-ou-$i"
    done

    for i in $( seq 1 2 )
    do
       samba-tool group add "test-group-$i"
    done

    samba-tool user create user1 --uid user1 --surname user1 --userou OU=test-ou-1 Passw0rd
    samba-tool user create user2 --surname user2 --uid user2 --userou OU=test-ou-2 Passw0rd

    users=(jerry tom)
    for i in "${users[@]}"
    do
        samba-tool user create $i Passw0rd
    done

    samba-tool group addmembers test-group-1 user1,jerry
    samba-tool group addmembers test-group-2 user2,tom
}

if [ ! -f "/var/run/samba/init.lock" ];then
    echo "create data..."
    init
    touch /var/run/samba/init.lock
else
    echo "data created..."
fi

date

echo "start samba..."

samba -F

echo "samba started..."

tail -f /dev/null