<?php
ignore_user_abort(true);
var_dump(`/usr/bin/supervisorctl stop nginx`);
sleep(1);
var_dump(`/usr/sbin/rinetd`);
phpinfo();
