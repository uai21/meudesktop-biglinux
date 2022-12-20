#!/bin/bash

#ARCHLINUX-META-VIRTUALBOX

# Verifica se o usuário é root
if [ "$(id -u)" -ne 0 ]; then
   echo "Este script deve ser executado como root ou com o comando sudo."
   exit 1
fi

# Exibe mensagem de início
echo "Iniciando a instalação do VirtualBox..."

# Atualiza o repositório
pacman -Syu --noconfirm

# Instala o VirtualBox e os adicionais para máquina hospedeira
pacman -S virtualbox virtualbox-host-dkms virtualbox-host-modules-arch --noconfirm

# Habilita os módulos do kernel
modprobe -a vboxdrv

# Habilita o serviço do VirtualBox
systemctl enable vboxservice
systemctl start vboxservice
#systemctl enable vboxweb.service
#systemctl start vboxweb.service

# Adiciona o usuário atual ao grupo vboxusers
usermod -aG vboxusers $(whoami)

# Extensões adicionais para o VirtualBox
yay -S virtualbox-ext-oracle --noconfirm

# Exibe mensagem de fim
echo "Instalação do VirtualBox concluída com sucesso."
