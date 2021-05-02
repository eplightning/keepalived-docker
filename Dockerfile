FROM alpine:3.13

RUN apk add --no-cache keepalived tini nftables iptables iproute2 ipvsadm iputils && \
    adduser -S -H -G users -u 500 keepalived_script

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/sbin/keepalived", "-n", "-l"]
