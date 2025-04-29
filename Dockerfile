FROM php:8.2-apache

# Instalar extensiones necesarias (si las necesitas)
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Copiar el contenido del proyecto
COPY . /var/www/html/

# Asegurarse de que Apache sirva los archivos PHP
WORKDIR /var/www/html

# Iniciar Apache en primer plano
CMD ["apache2-foreground"]
