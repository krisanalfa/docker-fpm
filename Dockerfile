FROM debian:wheezy

MAINTAINER Krisanalfa <krisan47@gmail.com>

RUN echo "Acquire::http { Proxy \"http://192.168.1.10:3142\"; };" > /etc/apt/apt.conf.d/02proxy && \
    echo "deb http://kambing.ui.ac.id/debian/ wheezy main" > /etc/apt/sources.list && \
    echo "deb http://kambing.ui.ac.id/debian-security/ wheezy/updates main" >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y php5-fpm php5-mcrypt php5-xdebug && \
    cd /etc/php5/fpm && \
    sed -i "s/^;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" php.ini;

COPY root/ /

EXPOSE 9000

CMD ["php5-fpm", "-F"]
