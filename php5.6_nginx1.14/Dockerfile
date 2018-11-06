FROM alpine
RUN apk update && apk upgrade
RUN apk add --no-cache musl-dev
RUN apk add libxml2
RUN apk add libxml2-dev
RUN apk add openssl
RUN apk add openssl-dev
RUN apk add libpng-dev
RUN apk add jpeg-dev
RUN apk add make
RUN mkdir /usr/local/php5.6.38
RUN apk add gcc
RUN mkdir /soft
RUN wget http://cn2.php.net/get/php-5.6.38.tar.gz/from/this/mirror -O php5.6.38.tar.gz
RUN tar xvzf php5.6.38.tar.gz -C /soft
RUN /soft/php-5.6.38/configure --prefix=/usr/local/php5.6.38 --enable-fpm --with-fpm-group=www-data --with-fpm-user=www-data --with-gd --with-pdo-mysql --enable-mbstring --with-openssl --with-pcre-regex --enable-bcmath --with-mysqli --enable-mysqlnd --with-pear && make && make install
RUN cp /usr/local/php5.6.38/etc/php-fpm.conf.default  /usr/local/php5.6.38/etc/php-fpm.conf
RUN addgroup  www-data && adduser -D -G www-data www-data
RUN wget http://nginx.org/download/nginx-1.14.0.tar.gz -O nginx1.14.tar.gz
RUN tar xzf nginx1.14.tar.gz -C /soft
RUN apk add pcre-dev --no-cache
RUN cd /soft/nginx-1.14.0;./configure --prefix=/usr/local/nginx1.14 --with-pcre --with-zlib= --with-openssl= --with-http_sub_module --with-http_ssl_module --user=www-data --group=www-data
RUN cd /soft/nginx-1.14.0;make && make install
RUN rm php5.6.38.tar.gz
RUN rm nginx1.14.tar.gz
expose 443 80
WORKDIR /usr/local/nginx1.14/html
COPY entrypoint.sh /bin
COPY nginx.conf /usr/local/nginx1.14/conf
RUN chmod +x /bin/entrypoint.sh
#ENTRYPOINT entrypoint.sh
CMD ["entrypoint.sh","-"]
