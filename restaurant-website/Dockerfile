FROM php:8.3.0-fpm

WORKDIR /app/grilli
COPY . .


# Update system and install compose dependencies
RUN apt update && apt upgrade -y && \
    apt install libicu-dev git -y && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Composer install
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# Install php dependencies and compile
RUN docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    composer install --no-dev --optimize-autoloader

RUN chown -R www-data:www-data /app/grilli
USER www-data
