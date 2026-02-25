FROM php:8.2-apache

# Install MySQL extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache rewrite safely
RUN a2enmod rewrite

# Allow .htaccess overrides
RUN sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Set web root
WORKDIR /var/www/html

# Copy project files
COPY . /var/www/html/

# Expose port 80
EXPOSE 80

CMD ["apache2-foreground"]






