FROM php:8.0-apache
WORKDIR /var/www/html
COPY . /var/www/html
ENV DB_SERVER=192.168.1.170
ENV DB_USERNAME=ongraph
ENV DB_PASSWORD=ongraph
ENV DB_NAME=ongraph
RUN docker-php-ext-install mysqli
EXPOSE 80
