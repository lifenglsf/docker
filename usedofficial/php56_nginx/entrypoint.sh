#!/bin/sh
set -e
php-fpm
if [ "${1:0:1}" = '-' ]; then
    set -- segment "$@" #如果第一个参数的第一个字符是【-】,在所有参数前添加segment 以空格分割
fi

if [ "$1" = 'segment' ]; then
	nginx -g "daemon off;"
fi

