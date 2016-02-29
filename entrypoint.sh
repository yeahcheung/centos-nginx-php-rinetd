#!/bin/bash
set -e
exec "$@"
sed -i "s/sitename/${SITE_NAME}/g" /etc/nginx/conf.d/default.conf
sitePath = "/opt/${SITE_NAME}"
[ ! -d "$sitePath" ] && mkdir "$sitePath"
/usr/bin/htpasswd -c -d -b /usr/share/nginx/htpasswd root $AUTH_PASSWORD
