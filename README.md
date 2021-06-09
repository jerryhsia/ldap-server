# ldap-server

```
docker run -d --name ldap-server -p 8389:389 --privileged=true jerry9916/ldap-server:latest

samba-tool user create Tom Passw0rd
```

## accounts

```
DN：CN=Administrator,CN=Users,DC=ldap,DC=kong,DC=com
PASSWORD：Passw0rd

DN：CN=Jerry,CN=Users,DC=ldap,DC=kong,DC=com
PASSWORD：Passw0rd
```