#!/bin/bash

# Alguns ajustes do sudo

# Adiciona a linha no final do arquivo /etc/sudoers

#Executar o pacman sem a necessidade do sudo
echo "$USER ALL=(ALL) NOPASSWD: /usr/bin/pacman" | sudo tee -a /etc/sudoers
