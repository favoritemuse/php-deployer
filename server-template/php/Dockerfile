FROM php:8.0-apache

RUN apt-get update && apt-get install -y \
    libssl-dev \
    nano \
    cron \
    curl \
    msmtp \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN a2enmod rewrite

RUN mkdir -p /var/lib/php/sessions && chmod -R 777 /var/lib/php/sessions

COPY php.ini /usr/local/etc/php/php.ini
COPY apache.conf /etc/apache2/sites-available/000-default.conf

CMD ["apache2-foreground"]
