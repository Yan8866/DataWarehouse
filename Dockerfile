FROM php:8.2-apache

RUN ls -la /etc/apache2/mods-enabled/ | grep mpm

# Forcefully clear ALL mpm symlinks and manually create only prefork
RUN find /etc/apache2/mods-enabled/ -name 'mpm_*' -delete && \
    ln -s /etc/apache2/mods-available/mpm_prefork.conf /etc/apache2/mods-enabled/mpm_prefork.conf && \
    ln -s /etc/apache2/mods-available/mpm_prefork.load /etc/apache2/mods-enabled/mpm_prefork.load

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





