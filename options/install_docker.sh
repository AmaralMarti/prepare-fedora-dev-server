install_docker() {
    echo "Instalando Docker..."
    sudo dnf remove -y docker \
                       docker-client \
                       docker-client-latest \
                       docker-common \
                       docker-latest \
                       docker-latest-logrotate \
                       docker-logrotate \
                       docker-selinux \
                       docker-engine-selinux \
                       docker-engine

    sudo dnf install -y dnf-plugins-core
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable docker
    sudo systemctl start docker
}

run_without_sudo() {
    sudo groupadd docker
    sudo usermod -aG docker $USER
}