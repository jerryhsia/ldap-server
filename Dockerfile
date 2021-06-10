FROM jerry9916/alpine-box:latest

WORKDIR /root

COPY smb.conf build.sh entrypoint.sh /root/
RUN /root/build.sh

EXPOSE 389

ENTRYPOINT ["/root/entrypoint.sh"]

