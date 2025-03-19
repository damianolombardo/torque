FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install required packages
RUN apt-get update
 # && apt-get install -y \
    # php8.2-mysql \
    # && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite


RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql


# Copy repository files into the container
COPY ./web /var/www/html

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Expose Apache port
EXPOSE 80

# Start Apache service
CMD ["apache2-foreground"]

