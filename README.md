# php-apache-composer

This repo used for build docker images : [docker link](https://hub.docker.com/r/shimohira/php-apache-composer/)

Docker base from build php:0.7-apache :
1. composer installation
2. a2enmod rewrite
3. add some php plugin

mount point :
> Apache : /var/www/html
> Composer : /home/composer/.composer

how running container :

`docker run -d -p 8080:80 -v $(pwd):/var/www/html -v composer:/home/composer/.composer shimohira/php-apache-composer:7.0-apache`