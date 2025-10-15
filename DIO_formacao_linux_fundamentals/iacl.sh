#!/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

useradd carlos -p $(openssl passwd -crypt senha123) -G GRP_ADM
useradd maria -p $(openssl passwd -crypt senha123) -G GRP_ADM
useradd joao -p $(openssl passwd -crypt senha123) -G GRP_ADM

useradd debora -p $(openssl passwd -crypt senha123) -G GRP_VEN
useradd sebastiana -p $(openssl passwd -crypt senha123) -G GRP_VEN
useradd roberto -p $(openssl passwd -crypt senha123) -G GRP_VEN

useradd josefina -p $(openssl passwd -crypt senha123) -G GRP_SEC
useradd amanda -p $(openssl passwd -crypt senha123) -G GRP_SEC
useradd rogerio -p $(openssl passwd -crypt senha123) -G GRP_SEC

echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim...."
