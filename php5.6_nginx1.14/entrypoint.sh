#!/bin/sh
set -e
/usr/local/php5.6.38/sbin/php-fpm
if [ "${1:0:1}" = '-' ]; then
    set -- segment "$@" #如果第一个参数的第一个字符是【-】,在所有参数前添加segment 以空格分割
fi

if [ "$1" = 'segment' ]; then
	/usr/local/nginx1.14/sbin/nginx -g "daemon off;"
fi

