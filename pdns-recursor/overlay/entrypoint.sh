#!/bin/bash
set -e

#echo "Getting IP address of PowerDNS Recursor..."
#MASTER_ADDR=$(dig a +short $MASTER)
#echo "Got resolver address of ${MASTER_ADDR}"
#     --forward-zones="_msdcs.epiclan.local=${MASTER_ADDR}:5300, epiclan.local=${MASTER_ADDR}:5300, event.epiclan.net=${MASTER_ADDR}:5300, event=${MASTER_ADDR}:5300, redirect.epicservers.co.uk=${MASTER_ADDR}:5300, sourcebans.epicservers.co.uk=${MASTER_ADDR}:5300, unifi=${MASTER_ADDR}:5300, www=${MASTER_ADDR}:5300" \
#    --forward-zones-recurse=".=${UPSTREAM_RECURSOR}"
#
#     --forward-zones=".=${UPSTREAM_RECURSOR}"
#    --forward-zones-recurse=".=${MASTER_ADDR}:5300"


echo "Starting PowerDNS Recursor..."
/usr/sbin/pdns_recursor \
    --daemon=no \
    --local-address=0.0.0.0:53 \
    --webserver=yes \
    --webserver-address=0.0.0.0 \
    --webserver-password=$PDNS_WEBSERVER_PASSWORD \
    --api-key=$PDNS_API_KEY \
    --network-timeout=5000 \
    --allow-from="${ALLOW_FROM}" \
    --forward-zones=".={$MASTER_ADDR}:5300"
    --forward-zones-recurse=".=${UPSTREAM_RECURSOR}"
