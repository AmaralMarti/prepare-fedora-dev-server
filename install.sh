#!/bin/bash

# Atualiza os pacotes e instala o git
sudo dnf upgrade -y
sudo dnf install -y git

# Clona o repositório do GitHub
git clone https://github.com/AmaralMarti/prepare-fedora-dev-server.git
# Entra no diretório do repositório clonado
cd prepare-fedora-dev-server

# Torna o script executável e executa-o
chmod +x prepare-ubuntu-dev-server.sh
./prepare-ubuntu-dev-server.sh
