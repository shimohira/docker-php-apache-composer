## Supported tags
- latest [(7.2)](https://github.com/shimohira/php-apache-composer/tree/master/7.2)
- 7.2-apache [(7.2)](https://github.com/shimohira/php-apache-composer/tree/master/7.2)
- 7.0-apache [(7.0)](https://github.com/shimohira/php-apache-composer/tree/master/7.0)
- 5.6-apache [(5.6)](https://github.com/shimohira/php-apache-composer/tree/5.6/5.6)

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