FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive \
    AXFR_IPS=127.0.0.1/8

COPY overlay /

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      iputils-ping dnsutils pdns-server pdns-backend-mysql mysql-client && \
    rm -rf /etc/powerdns/pdns.d/*.conf && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]