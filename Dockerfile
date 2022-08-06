FROM php:7.1-cli-alpine

LABEL author="zr87"
MAINTAINER Zoltan Rakottyai <zoltanrakottyai[at]gmail.com>

ENV APP_ROOT=/var/www/html QUEUE_DRIVER=database NUM_PROCS=4 OPTIONS=""

ADD supervisord.conf /etc/

RUN docker-php-ext-install pdo_mysql \
    && docker-php-ext-install bcmath

RUN apk add --update supervisor && rm -rf /tmp/* /var/cache/apk/*

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
