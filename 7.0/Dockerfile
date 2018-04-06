FROM php:7.0-apache

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev \
  libjpeg-dev \
  libpq-dev \
  libicu-dev \ 
  libfreetype6-dev \
  libmcrypt-dev \
  && rm -rf /var/lib/apt/lists/*

# clean after install
RUN apt-get clean

# install php extension
RUN docker-php-ext-install -j$(nproc) \
  mcrypt \
  intl \
  pcntl \
  gd \
  mbstring \
  pdo \
  pdo_mysql \
  pdo_pgsql \
  zip

# configure php extension
RUN docker-php-ext-configure \
  gd --with-png-dir=/usr/include/ \
  --with-jpeg-dir=/usr/include/ \
  --with-freetype-dir=/usr/include/

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
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
