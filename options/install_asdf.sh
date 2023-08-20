install_asdf() {
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0

    # Para bash
    echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
    echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc
    source ~/.bashrc

    # Para zsh
    if which zsh > /dev/null; then
        echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
        echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.zshrc
        source ~/.zshrc
    fi

    export TERM=xterm-color

    # Armazena a saída do comando dialog em uma variável
    opcoes=$(dialog --colors --stdout --separate-output \
    --title "" \
    --checklist "Adicionar plugins do ASDF:" 0 0 0 \
    1 "Node JS - 18.16.1" on \
    2 "Node JS - 16.20.1" on \
    3 "Node JS - 14.21.3" on \
    4 "Python - 3.11.4" on \
    5 "Python - 2.7.18" on \
    6 "PHP - 8.2.8" on \
    7 "PHP - 7.4.30" on \
    )

    # Verifica se o usuário pressionou Esc ou Cancelar
    if [ $? -eq 1 ] || [ $? -eq 255 ]; then
        clear
        echo "Operação cancelada pelo usuário."
        exit 1
    fi

    # Processa as opções selecionadas pelo usuário
    for opcao in $opcoes; do
        case $opcao in
            1)
                echo "Instalando plugin de Node JS..."
                asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
                asdf install nodejs 18.16.1
                ;;
        2)
                echo "Instalando plugin de Node JS..."
                asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
                asdf install nodejs 16.20.1
                ;;
        3)
                echo "Instalando plugin de Node JS..."
                asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
                asdf install nodejs 14.21.3
                ;;                        
            4)
                echo "Instalando plugin de Python..."                
                sudo dnf install gcc make patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel
                asdf plugin add python https://github.com/danhper/asdf-python.git                
                asdf install python 3.11.4
                ;;
            5)
                echo "Instalando plugin de Python..."                
                sudo dnf install gcc make patch zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel
                asdf plugin add python https://github.com/danhper/asdf-python.git            
                asdf install python 2.7.18
                ;;

            6)
                echo "Instalando plugin de PHP..."
                sudo dnf install -y autoconf bison re2c libcurl libcurl-devel gd-devel gcc-c++ oniguruma oniguruma-devel postgresql-devel libzip-devel sqlite-devel readline-devel
                asdf plugin add php https://github.com/asdf-community/asdf-php.git
                asdf install php 8.2.8
                ;;
            7)
                echo "Instalando plugin de PHP..."
                sudo dnf install -y autoconf bison re2c libcurl libcurl-devel gd-devel gcc-c++ oniguruma oniguruma-devel postgresql-devel libzip-devel sqlite-devel readline-devel
                asdf plugin add php https://github.com/asdf-community/asdf-php.git
                asdf install php 7.4.30
                ;;
        esac
    done
}
