# Use the official Bitnami WordPress image as the base image
FROM bitnami/wordpress:latest

# Switch to the root user
USER root

# Install necessary dependencies and Composer
RUN apt-get update && \
    apt-get install -y unzip curl && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set environment variables for Composer
ENV COMPOSER_HOME=/opt/bitnami/wordpress/.composer

# Set appropriate permissions for Composer home directory
RUN mkdir -p /opt/bitnami/wordpress/.composer && \
    chown -R 1001:1001 /opt/bitnami/wordpress/.composer

# Switch back to the non-root user
#USER 1001

# Change to the WordPress installation directory
WORKDIR /opt/bitnami/wordpress
COPY config/wp-config.php .

# Configure Composer to allow plugins
RUN composer config --global allow-plugins.composer/installers true

# Install WP Offload Media plugin using Composer
RUN composer require deliciousbrains/wp-amazon-s3-and-cloudfront

# Expose the port WordPress will run on
EXPOSE 8080

# Use the default command for Bitnami WordPress
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/opt/bitnami/wordpress"]
