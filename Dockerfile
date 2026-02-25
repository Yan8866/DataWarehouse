# Use official PHP + Apache image
FROM php:8.2-apache

# Fix: disable conflicting MPMs, keep only mpm_prefork (required for mod_php)
RUN a2dismod mpm_event mpm_worker && a2enmod mpm_prefork

# Install MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable mod_rewrite
RUN a2enmod rewrite

# Allow .htaccess overrides
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

WORKDIR /var/www/html
COPY . /var/www/html/

EXPOSE 80
CMD ["apache2-foreground"]



