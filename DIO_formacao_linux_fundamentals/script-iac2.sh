#!/bin/bash


echo "Atualizando sistema... "
apt-get update
apt-get upgrade -y

apt-get install apache2 unzip2 -y
apt-get install unzip2 -y

echo "Baixando e copiando arquivos da aplicação... "

cd /tmp
wget https://github.com/Lucasmbv/DIO/blob/main/DIO_formacao_linux_fundamentals/iacl.sh

unzip main.zip

cd linux-site-dio-main

cp -R * /var/www/html/
