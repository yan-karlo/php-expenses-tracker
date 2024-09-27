# Usa a imagem oficial do PHP com FPM e Alpine Linux
FROM php:8.1-apache

# Instala dependências do sistema e Composer
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    tree \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Habilita mod_rewrite do Apache
RUN a2enmod rewrite

# Instala o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Define o diretório de trabalho dentro do container
WORKDIR /var/www/html

# Copia o composer.json e composer.lock para o container
#COPY ./backend/public/composer.json ./

# Copia o código da aplicação para o container
COPY ./backend/public /var/www/html

# Instala as dependências do Composer
RUN composer install

# Copia a configuracao de rota do apache
COPY ./apache/000-default.conf /etc/apache2/sites-available/

# Habilita o virtual host
RUN a2ensite 000-default.conf
#RUN service apache2 reload

# Expondo a porta 9000 para PHP-FPM
EXPOSE 80:80

# Comando padrão para rodar o Apache no foreground
CMD ["apache2-foreground"]
