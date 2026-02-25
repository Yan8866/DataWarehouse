# Use official PHP + Apache image
FROM php:8.2-apache

# Install MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable .htaccess / mod_rewrite if you use it
RUN a2enmod rewrite

# Allow .htaccess overrides
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Copy all project files into web root
COPY . /var/www/html/

# Apache already listens on port 80, which Railway understands
EXPOSE 80


CMD ["apache2-foreground"]
