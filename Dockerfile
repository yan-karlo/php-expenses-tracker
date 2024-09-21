# Usa a imagem oficial do PHP com FPM e Alpine Linux
FROM php:8.1-fpm-alpine

# Instala dependências necessárias (git, unzip e curl)
RUN apk add --no-cache git unzip curl

# Instala o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Define o diretório de trabalho dentro do container
WORKDIR /var/www/html

# Copia o composer.json e composer.lock para o container
COPY ./backend/composer.json ./

# Instala as dependências do Composer
RUN composer install

# Copia o código da aplicação para o container
COPY ./backend/public /var/www/html

# Expondo a porta 9000 para PHP-FPM
EXPOSE 9000:9000

# Comando padrão para iniciar o PHP-FPM
CMD ["php-fpm"]
