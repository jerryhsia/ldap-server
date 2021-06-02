FROM jerry9916/alpine-box:latest

WORKDIR /root

COPY smb.conf install.sh entrypoint.sh /root/
RUN /root/install.sh

EXPOSE 389

ENTRYPOINT ["/root/entrypoint.sh"]
