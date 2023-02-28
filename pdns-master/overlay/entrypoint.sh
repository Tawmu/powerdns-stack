#!/bin/bash
set -e

echo "Waiting for MySQL to become available..."
while ! mysqladmin ping -h"$MYSQL_SERVER" -p"$MYSQL_PORT" --silent; do
    sleep 1
done

echo "Starting server"
/usr/sbin/pdns_server \
	--daemon=no \
	--launch=gmysql \
	--gmysql-user=$MYSQL_USERNAME \
	--gmysql-password=$MYSQL_PASSWORD \
	--gmysql-host=$MYSQL_SERVER \
	--gmysql-port=$MYSQL_PORT \
	--gmysql-dbname=$MYSQL_DATABASE \
	--allow-axfr-ips=$AXFR_IPS \
	--disable-axfr=no \
	--master=yes \
	--webserver=yes \
	--webserver-address=0.0.0.0 \
	--webserver-allow-from=0.0.0.0/0 \
	--api=yes \
	--api-key=$API_KEY \
	--expand-alias=yes \
	--local-port=5300