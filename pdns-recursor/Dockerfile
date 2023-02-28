FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

COPY overlay /

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
       iputils-ping dnsutils pdns-recursor && \
  chmod +x /entrypoint.sh

EXPOSE 53 8082
ENTRYPOINT ["/entrypoint.sh"]
