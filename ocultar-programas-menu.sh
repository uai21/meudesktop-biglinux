#!/bin/bash

# Copia os arquivos .desktop do diretório /usr/share/applications/ para a pasta ~/.local/share/applications/
cp /usr/share/applications/*.desktop ~/.local/share/applications/

# A partir daqui incluir os programas que deseja ocultar

# Inclui a linha NoDisplay=false no arquivo isotop.desktop
sed -i '/NoDisplay/ s/^#*/#/' ~/.local/share/applications/isotop.desktop
echo "NoDisplay=false" >> ~/.local/share/applications/isotop.desktop

# Inclui a linha NoDisplay=false no arquivo avahi-discover.desktop
sed -i '/NoDisplay/ s/^#*/#/' ~/.local/share/applications/avahi-discover.desktop
echo "NoDisplay=false" >> ~/.local/share/applications/avahi-discover.desktop

# Atualiza o menu do LXQt
lxqt-admin-menu
