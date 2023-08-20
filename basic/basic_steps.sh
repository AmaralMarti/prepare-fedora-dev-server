install_init_dependencies() {
    echo "Atualizando o Fedora..."
    sudo dnf upgrade -y && sudo dnf autoremove -y && sudo dnf install -y dialog wget curl openssl
}

show_ips() {
    echo "Enderecos IP das interfaces de rede:"
    ip -4 -o addr show | grep -v ' lo\|docker' | awk '{print $2 ": " $4}'
}

install_speed_test() {
    curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash
    sudo dnf install -y speedtest    
}

install_vim() {
    echo "Instalando vim..."
    sudo dnf install -y vim
}

install_git () {
    echo "Instalando git..."
    sudo dnf install -y git
}

install_htop() {
    echo "Instalando htop..."
    sudo dnf install -y htop
}

install_nettools() {
    echo "Instalando net-tools..."
    sudo dnf install -y net-tools
}

install_neofetch() {
    echo "Instalando neofetch..."
    sudo dnf install -y neofetch
}

install_bashtop() {
    echo "Instalando bashtop..."
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm   
    sudo dnf install -y bashtop
}

install_btop() {
    echo "Instalando btop..."
    sudo dnf install -y btop
}

install_ncdu() {
    echo "Instalando ncdu..."
    sudo dnf install -y ncdu
}