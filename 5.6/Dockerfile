FROM php:5.6-apache

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng-dev \
  libjpeg-dev \
  libpq-dev \
  libicu-dev \ 
  libfreetype6-dev \
  libmcrypt-dev \
  && rm -rf /var/lib/apt/lists/*

# clean after install
RUN apt-get clean

# install php extension
RUN /usr/local/bin/docker-php-ext-install -j$(nproc) \
  mysql \
  mcrypt \
  intl \
  pcntl \
  gd \
  mbstring \
  pdo \
  pdo_mysql \
  pdo_pgsql \
  zip \
  json \
  mysqli

# configure php extension
RUN /usr/local/bin/docker-php-ext-configure \
  gd --with-png-dir=/usr/include/ \
  --with-jpeg-dir=/usr/include/ \
  --with-freetype-dir=/usr/include/

RUN docker-php-ext-enable pcntl pdo_mysql mysql json
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');"

RUN mv composer.phar /bin/composer

RUN adduser --disabled-password --gecos "" composer \
  && mkdir -p /home/composer/.composer \
  && chown -R composer:composer /home/composer/.composer \
  && ls /home/composer/.composer

COPY ./run_composer.sh /home/composer/run_composer.sh

RUN echo 'alias composer="/bin/sh /home/composer/run_composer.sh"' >> /root/.bashrc
RUN a2enmod rewrite

WORKDIR /var/www/html
