#!/bin/bash

# Verificar se há processos na porta 80
if sudo lsof -t -i:80 &> /dev/null; then
    # Se houver processos, matá-los
    sudo kill -9 $(sudo lsof -t -i:80)
    echo "Processos na porta 80 foram encerrados."
else
    echo "Nenhum processo encontrado na porta 80."
fi


/etc/init.d/apache2 stop
systemctl stop apache2.service

# Iniciar um contêiner Docker com o ID especificado
docker start production_nginx_1

# Iniciar um a sincronização do banco de dados
docker start sync-database





# #!/bin/bash

# # Parar o serviço Apache
# systemctl stop apache2.service

# # Matar processos que estão usando a porta 80 (supondo que o Apache está na porta 80)
# sudo kill -9 $(sudo lsof -t -i:80)

# # Parar o Apache usando /etc/init.d/
# sudo /etc/init.d/apache2 stop

# # Iniciar um contêiner Docker com o ID especificado
# docker start production_nginx_1


# # Iniciar um a sincronização do banco de dados
# docker start sync-database



