FROM php:5.6.38-fpm-alpine
RUN apk add nginx
RUN mkdir -p /run/nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint.sh /bin
RUN chmod +x /bin/entrypoint.sh
#RUN nginx
CMD ["entrypoint.sh","-"]
