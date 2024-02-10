FROM composer:latest AS composer

WORKDIR /app/grilli
COPY . .

RUN composer install --no-dev --optimize-autoloader

FROM php:8.3.0-fpm-alpine

WORKDIR /app/grilli
COPY --from=composer /app/grilli .

RUN chown -R www-data:www-data /app/grilli
USER www-data
