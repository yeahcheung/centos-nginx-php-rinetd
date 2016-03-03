#!/bin/bash
set -e
exec "$@"
sed -i "s/sitename/${SITE_NAME}/g" /etc/nginx/conf.d/default.conf
sitePath="/opt/${SITE_NAME}"
[ ! -d "$sitePath" ] && mkdir "$sitePath"
#/usr/bin/htpasswd -c -d -b /usr/share/nginx/htpasswd root $AUTH_PASSWORD
RUN sed -i "s/AUTH_USER/${AUTH_USER}/g" /usr/share/nginx/ops/index.php
RUN sed -i "s/AUTH_PASSWORD/${AUTH_PASSWORD}/g" /usr/share/nginx/ops/index.php
