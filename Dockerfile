FROM alpine:latest AS fetcher

RUN apk add --no-cache curl

WORKDIR /tmp/src

RUN curl -Lf -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" \
    https://download.revive-adserver.com/revive-adserver-6.0.6.tar.gz \
    -o revive.tar.gz

RUN mkdir /tmp/out && tar -xzf revive.tar.gz --strip-components=1 -C /tmp/out


FROM php:8.5-fpm-alpine

RUN apk add --no-cache \
    libpng-dev \
    icu-dev \
    libxml2-dev \
    libzip-dev \
    postgresql-dev \
    zlib-dev

RUN docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) gd intl pgsql xml zip

WORKDIR /var/www/html

COPY --from=fetcher /tmp/out /var/www/html

COPY php-error-logging.ini /usr/local/etc/php/conf.d/error-logging.ini

# Ensure PHP-FPM explicitly listens on port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /usr/local/etc/php-fpm.d/zz-docker.conf

CMD ["php-fpm"]