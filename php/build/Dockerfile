FROM armv7/armhf-ubuntu:14.04

RUN apt-get update&& apt-get upgrade -y && apt-get autoremove && apt-get autoclean

RUN apt-get  -y  install python-software-properties software-properties-common  --force-yes
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update&& apt-get upgrade -y --force-yes && apt-get autoremove && apt-get autoclean

RUN apt-get  -y install mc nano php7.0-mysql curl wget php7.0  --force-yes

ENV ALLOW_OVERRIDE **True**

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf

COPY 000-laravel.conf /etc/apache2/sites-enabled/
COPY 000-laravel.conf /etc/apache2/sites-available/


RUN mkdir -p /opt/app/log 
RUN mkdir -p /opt/app/www 
RUN rm -fr /var/www/html 
RUN ln -s /opt/app /var/www/html

RUN sed -i "s/Listen 80/Listen 8089/g" /etc/apache2/ports.conf
RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf
RUN a2enmod rewrite


EXPOSE 8089
WORKDIR /var/www/html
CMD ["/run.sh"]
