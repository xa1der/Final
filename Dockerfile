#####Intial Image and Installations 
FROM ubuntu

RUN apt-get update

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt-get update && apt-get install -y tzdata

RUN apt-get install apache2-utils -y

RUN apt-get install -y apache2 -y

#####Proxy Install and enable####
RUN apt-get update

RUN service apache2 stop

RUN service apache2 start

RUN service apache2 restart

RUN a2enmod proxy

RUN a2enmod proxy_http

RUN a2enmod proxy_balancer

RUN a2enmod lbmethod_byrequests

#######Create group and configuration for sites######
RUN addgroup cit384

RUN useradd -g cit384 alice

RUN useradd -g cit384 george


###Self Signed CERT##########
RUN apt-get update && \
    apt-get install -y openssl && \
    openssl genrsa -des3 -passout pass:x -out /etc/ssl/private/server.pass.key 2048 && \
    openssl rsa -passin pass:x -in /etc/ssl/private/server.pass.key -out /etc/ssl/private/server.key && \
    rm /etc/ssl/private/server.pass.key && \
    openssl req -new -key /etc/ssl/private/server.key -out /etc/ssl/certs/server.csr \
        -subj "/C=UK/ST=Warwickshire/L=Leamington/O=OrgName/OU=IT Department/CN=mywebcite.cit384/CN=special.cit384/CN=final.cit384" && \
    openssl x509 -req -days 365 -in /etc/ssl/certs/server.csr -signkey /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt

###USER 1 Configurations #####
USER alice                                                                                                                                                                                                                                        RUN mkdir /home/user1/public_html

RUN mkdir /home/alice/public_html

COPY ./alice.html /home/alice/public_html

COPY ./alice.jpg /home/alice/public_html

######USER 2 Configurations ####
USER george
                                                                                                                                                                                                                
RUN mkdir /home/george/public_html

COPY ./george.html /home/george/public_html

COPY ./george.jpg /home/george/public_html
                                                  
######Web server Configurations #####
USER root

RUN mkdir /var/www/mywebsite.cit384

RUN mkdir /var/www/special.cit384

RUN mkdir /var/www/final.cit384

COPY ./mywebsite.html /var/www/mywebsite.cit384

COPY ./special.html /var/www/special.cit384

COPY ./submission.md /var/www/final.cit384

COPY ./submission.txt /home
                                                                                                                         
COPY ./.htaccess /var/www/final.cit384

#######Apache and Virtual Hosts Configurations ######
USER root

RUN a2dissite 000-default.conf

#############Upate images for site1.internal######


######################################

COPY ./mywebsite.cit384.conf /etc/apache2/sites-available

COPY ./special.cit384.conf /etc/apache2/sites-available

COPY ./final.cit384.conf /etc/apache2/sites-available

COPY ./mywebsite.cit384-ssl.conf /etc/apache2/sites-available

COPY ./special.cit384-ssl.conf /etc/apache2/sites-available

COPY ./final.cit384-ssl.conf /etc/apache2/sites-available

COPY ./load-balancer.conf /etc/apache2/sites-available 

RUN a2ensite mywebsite.cit384.conf

RUN a2ensite special.cit384.conf 

RUN a2ensite final.cit384.conf 

RUN service apache2 restart

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
