```
docker run -d --name ldap-server -p 1389:389 --privileged=true jerry9916/ldap-server:latest

samba-tool user create jerry9916 Jerry9916#
```