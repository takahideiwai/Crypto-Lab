# Base image VNC:Bionic
FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

MAINTAINER Takahide Iwai "tiwai@purdue.edu"

#add openssl and apache webserver
RUN apt-get update && apt-get -y install vim libssl-dev \
apache2

#create a non-root user 
RUN useradd -d /home/user -m -s /bin/bash user

RUN echo 'user:user' | chpasswd

ENV USER=user \
    PASSWORD=user 
RUN usermod -aG sudo user


# Make configuration files and directories for openssl
RUN mkdir /home/user/demoCA
COPY openssl.cnf /home/user/demoCA
RUN touch /home/user/demoCA/index.txt 
RUN mkdir /home/user/demoCA/certs
RUN mkdir /home/user/demoCA/crl
RUN mkdir /home/user/demoCA/newcerts
RUN touch /home/user/demoCA/serial
RUN echo '1000' >> /home/user/demoCA/serial


#File needed for HTTPS configuration
RUN mkdir /var/www/crypto
COPY index.html /var/www/crypto

# Change port number of http from 80 to 8000 
COPY ports.conf /etc/apache2/
COPY 000-default.conf /etc/apache2/sites-available

#Allow user to run certain commands without a password
ADD usersudo /etc/sudoers.d/
RUN chmod 0400 /etc/sudoers.d/usersudo
