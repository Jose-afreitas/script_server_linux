#!/bin/bash

# Parar o serviço Apache
systemctl stop apache2.service

# Matar processos que estão usando a porta 80 (supondo que o Apache está na porta 80)
sudo kill -9 $(sudo lsof -t -i:80)

# Parar o Apache usando /etc/init.d/
sudo /etc/init.d/apache2 stop

# Iniciar um contêiner Docker com o ID especificado
docker start production_nginx_1


# Iniciar um a sincronização do banco de dados
docker start sync-database



