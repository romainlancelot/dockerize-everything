#!/bin/sh

php bin/console importmap:install
php bin/console asset-map:compile
php bin/console cache:clear --env=prod
php-fpm
