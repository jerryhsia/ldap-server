# ldap-server

```
docker run -d --name ldap-server -p 8389:389 --privileged=true jerry9916/ldap-server:latest

samba-tool user create jack Passw0rd
```

## accounts

```
DN：CN=Administrator,CN=Users,DC=test,DC=com
PASSWORD：Passw0rd

DN：CN=jerry,CN=Users,DC=test,DC=com
PASSWORD：Passw0rd

DN：CN=tom,CN=Users,DC=test,DC=com
PASSWORD：Passw0rd
```