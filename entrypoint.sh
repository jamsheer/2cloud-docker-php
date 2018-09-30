#!/bin/bash -e

j2 /templates/nginx-default.conf.j2 > /etc/nginx/conf.d/default.conf
j2 /templates/supervisord.conf.j2 > /etc/supervisor/conf.d/supervisord.conf
j2 /templates/php-fpm.conf.j2 > /usr/local/etc/php-fpm.conf
j2 /templates/msmtprc.j2 > /etc/msmtprc

umask 002

chown -R www-data:www-data /var/www
chmod -R g=u /var/www
chmod -f 644 /etc/crontab

exec "$@"
