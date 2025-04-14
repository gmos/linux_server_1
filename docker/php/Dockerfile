FROM php:8.3-fpm-alpine

# Install necessary dependencies and extensions
RUN apk add --no-cache \
    bash \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd mysqli pdo pdo_mysql opcache bcmath

# Set working directory
WORKDIR /var/www/html





