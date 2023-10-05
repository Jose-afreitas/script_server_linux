# Criando um scrip para o linux

###### crie um arquivo na raiz do linuz com o nome que desejar (script_service_rdponline.sh) lembre-se

###### de colocar a extensão .sh no arquivo

###### feito isso torne o arquivo executável com o comando

###### chmod +x script_service_rdponline.sh

###### veja as permissões do arquivo com o comando: ls -l script_service_rdponline.sh

###### Agora, você pode executar o script com privilégios de superusuário (root) usando sudo: sudo ./meu_script.sh

###### Este script executará os comandos na ordem especificada. Certifique-se de que o arquivo de script tenha permissões de execução e de que você esteja ciente dos riscos ao executar comandos que interrompem ou reiniciam serviços no sistema. Certifique-se também de que o contêiner Docker especificado (com o ID e5e8fc10f8b0) esteja disponível e pronto para ser iniciado.

###### tornando o arquivo executavel pelo systemd

###### cd /etc/systemd/system

###### verifique os scrips que já possuem nesse local com o comando " ls -ltr "

###### Crie um arquivo de unidade do systemd para configurar o script_service_rdponline.sh como um serviço:

###### nome do arquivo(script_service_rdponline.service) não se esqueça de colocar a extenção do arquivo como "SERVICE"

###### Adicione o conteudo abaixo dentro do arquivo que acabou de criar

[Unit]
Description=Script subindo nginx do rdponline após o boot
Wants=network-online.target
After=network.target

[Service]
Type=simples
ExecStart=/bin/bash /root/script_service_rdponline.sh (caminho onde vai ficar o arquivo, no meu caso vai ficar apenas /script_service_rdponline.sh)
TimeoutStartSec=0

[Install]
WantedBy=default.target

###### Faça um reload no serviço so systemd com o comando, systemctl daemon-reload

###### verifique se ele está funcionando com o comando, systemctl status script_service_rdponline.service

###### configure para executar após o boot com o comando, systemctl enable script_service_rdponline.service

###### verifique o status com, systemctl -all | grep -i script_service_rdponline.service

###### feito isso ele irá execuatr toda vez que o linux for reiniciado.

###### fontes: https://www.youtube.com/watch?v=CSqyL4aoNQc

###### https://tecnobyte.com.br/124613668/Linux/Como-executar-um-script-na-inicializacao-do-Ubuntu-Linux
