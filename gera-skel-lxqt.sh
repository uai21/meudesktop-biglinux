#!/bin/bash
#AUTOR      : MAURÍCIO DE LIMA
#WEBSITE    : https://www.uaisolucoes.net.br
#E-MAIL:    : mauricio@uai21.com.br

# Copia os arquivos modificados nas últimas 12 horas de ~/.config para ~/skel

# O PROPÓSITO DESSE SCRIPT É GERAR OS ARQUIVOS E DIRETÓRIOS PARA UM SKEL DO LXQT
# O AMBIENTE QUE USEI FOI EM UMA MÁQUINA VIRTUAL COM O BIGLINUX COMMUNITY
# SISTEMA INSTALADO PURO, DEPOIS MODIFIQUEI O QUE PRECISA MODIFICAR E EXECUTEI O SCRIPT
# ASSIM TENHO CERTA QUE TODAS AS MINHAS MODIFICAÇÕES FORAM NO SENTIDO DAS PERSONALIZAÇÕES DO LXQT
# DEFINIR UM TEMPO DE 12 HORAS (TODAS AS MODICAÇÕES NAS ÚLTIMAS 12 HORAS)

# O Script está bem comentado, cada passo é detalhado.

# Define o prefixo para imprimir antes de cada comando executado pelo script
PS4='\e[1;32m+ \e[m'

# Verifica se o rsync está instalado
if ! command -v rsync &> /dev/null; then
  # Se não estiver instalado, instala o rsync com o pacman
  pacman -S --noconfirm rsync
fi

# Verifica se o diretório ~/skel existe
if [ ! -d ~/skel ]; then
  # Se não existir, cria o diretório
  mkdir ~/skel
else
  # Se existir, remove o diretório
  rm -rf ~/skel
  # Cria o diretório novamente
  mkdir ~/skel
fi

# Armazena a data atual em segundos desde a epoch (1 de janeiro de 1970)
now=$(date +%s)

# Define o limite de tempo para 12 horas atrás
limit=$(( $now - 12*3600 ))

# Encontra todos os arquivos e diretórios modificados nas últimas 12 horas
# dentro de ~/.config e armazena a lista em um arquivo temporário
find ~/.config -type f -newermt "@$limit" -print0 > /tmp/modified_files

# Copia todos os arquivos e diretórios encontrados para ~/skel, mantendo
# suas respectivas estruturas de diretórios
rsync -r --files-from=/tmp/modified_files ~/.config/ ~/skel

# Remove o arquivo temporário
rm /tmp/modified_files

# Imprime uma mensagem de sucesso
echo -e "\e[1;32mProcesso realizado com sucesso!\e[m"
