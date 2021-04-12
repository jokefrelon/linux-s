FROM ubuntu:20.04
ENV DL_VERSION 3.7.7
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
        && sed -i 's/security.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list \
        && export LANG=C.UTF-8 \
        && apt update \
        && export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true \
        && echo -e "tzdata tzdata/Areas select Asia\ntzdata tzdata/Zones/Asia select Shanghai" > /root/pre.txt \
        && debconf-set-selections /root/pre.txt \
        && apt -y install php7.4 php7.4-xml php7.4-zip nginx apache2 wget unzip nano net-tools \
        && wget -O /var/www/html/DirectoryLister-$DL_VERSION.zip https://github.com/DirectoryLister/DirectoryLister/releases/download/$DL_VERSION/DirectoryLister-$DL_VERSION.zip \
        && unzip /var/www/html/DirectoryLister-$DL_VERSION.zip -d /var/www/html/ \
        && service apache2 start >> /info.t 2>&1 \
        && echo "ServerName `cat /info.t | awk 'NR==2{print $14}' | sed 's/$/bye/g' | sed 's/.bye//g'`" >> /etc/apache2/apache2.conf \
        && rm /var/www/html/index.html \
        && service apache2 restart \
        && sed -i 's/# First attempt to serve request as file, then/proxy_pass http:\/\/localhost\/;/g' /etc/nginx/sites-enabled/default \
        && chmod  -R 777 /var/www/html \
        && mv /var/www/html/.env.example /var/www/html/.env \
        && sed -i 's/listen 80 default_server;/listen 8088;/g' /etc/nginx/sites-enabled/default \
        && sed -i 's/listen \[\:\:\]\:80 default_server;//g' /etc/nginx/sites-enabled/default \
        && service nginx start \
        && echo -e '#!/bin/bash\nservice apache2 start\nservice nginx start' > /root/grun.sh \
        && chmod 755 /root/grun.sh \
        && echo -e '#!/bin/bash\nbash /root/grun.sh\ntail -f /dev/null' > /root/np.sh \
        && chmod 755 /root/np.sh
CMD ["/root/np.sh"]