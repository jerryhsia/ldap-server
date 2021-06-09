#!/bin/zsh

set -e

init() {
    samba-tool domain provision --server-role=dc --use-rfc2307 --dns-backend=SAMBA_INTERNAL --realm=ldap.kong.com --domain=ldap --adminpass=Passw0rd

    orgUnits=(mathematicians scientists)
    for i in "${orgUnits[@]}"
    do
        samba-tool ou create "OU=$i"
    done

    for i in $( seq 1 2 )
    do
       samba-tool group add "test-group-$i"
    done

    samba-tool user create euclid --uid euclid --surname euclid --userou OU=mathematicians Passw0rd
    samba-tool user create einstein --surname einstein --uid einstein --userou OU=scientists Passw0rd

    users=(Jerry Tom)
    for i in "${users[@]}"
    do
        samba-tool user create $i Passw0rd
    done

    samba-tool group addmembers test-group-1 Jerry,Tom
    samba-tool group addmembers test-group-2 euclid,einstein
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