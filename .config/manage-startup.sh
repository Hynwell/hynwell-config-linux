#! /bin/bash

########################## Main Functions  #############################

function update_linux {

    echo "--------------------------------------------------------------------------------------------"
    echo "----------------------------------Update and Upgrade Linux----------------------------------"
    echo "--------------------------------------------------------------------------------------------"

    sudo apt update && sudo apt upgrade -y

    echo "--------------------------------------------------------------------------------------------"
    echo "---------------------------------------------END--------------------------------------------"
    echo "--------------------------------------------------------------------------------------------"
    echo "                                                                                            "
    echo "                                                                                            "

}


function install_soft {

    echo "--------------------------------------------------------------------------------------------"
    echo "----------------------------------------Install SOFT----------------------------------------"
    echo "--------------------------------------------------------------------------------------------"

    softwares_list=(git vim zsh bat gtop micro screen tldr curl) 
    for software_list in ${softwares_list[@]}
        do
            sudo apt install ${software_list} -y
        done

    echo "--------------------------------------------------------------------------------------------"
    echo "---------------------------------------------END--------------------------------------------"
    echo "--------------------------------------------------------------------------------------------"
    echo "                                                                                            "
    echo "                                                                                            "

}


function install_zsh {

    echo "-------------------------------------------------------------------------------------------"
    echo "----------------------------------------Install ZSH----------------------------------------"
    echo "-------------------------------------------------------------------------------------------"

    sudo apt install zsh -y

    mkdir -p ~/.config/zsh/plugins/

    curl https://raw.githubusercontent.com/Hynwell/hynwell-config-linux/main/.zshrc > ~/.zshrc
    curl https://raw.githubusercontent.com/Hynwell/hynwell-config-linux/main/.config/zsh/.p10k.zsh > ~/.config/zsh/.p10k.zsh
    curl https://raw.githubusercontent.com/Hynwell/hynwell-config-linux/main/.config/zsh/.alias > ~/.config/zsh/.alias

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
    git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git ~/.config/zsh/plugins/zsh-autocomplete
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting

    echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >>! ~/.zshrc
    chsh --shell /bin/zsh $USER

    echo "--------------------------------------------------------------------------------------------"
    echo "---------------------------------------------END--------------------------------------------"
    echo "--------------------------------------------------------------------------------------------"
    echo "                                                                                            "
    echo "                                                                                            "

}


function install_docker {

    echo "-------------------------------------------------------------------------------------------"
    echo "----------------------------------------Install Docker-------------------------------------"
    echo "-------------------------------------------------------------------------------------------"

    softwares_list_for_docker=(ca-certificates gnupg lsb-release)
    for software_list_for_docker in ${softwares_list_for_docker[@]}
        do
            sudo apt install $software_list_for_docker -y
        done

    sudo mkdir -m 0755 -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

    echo "--------------------------------------------------------------------------------------------"
    echo "---------------------------------------------END--------------------------------------------"
    echo "--------------------------------------------------------------------------------------------"
    echo "                                                                                            "
    echo "                                                                                            "

    docker --version
    docker compose version

    echo "                                                                                            "
    echo "                                                                                            "
    echo "--------------------------------------------------------------------------------------------"
    echo "--------------------------------------------------------------------------------------------"

}


function install_python {

    echo "-------------------------------------------------------------------------------------------"
    echo "-------------------------------DOWNLOAD SCRIPT INSTALL PYTHON------------------------------"
    echo "-------------------------------------------------------------------------------------------"

    git clone --quiet https://github.com/Hynwell/install-python3.11.git ~/scripts/install-python3.11
    chmod +x ~/scripts/install-python3.11/install-python3.11.sh
    ~/scripts/install-python3.11/install-python3.11.sh

}


function exit_menu {
    exit
}

########################## Functions for Menu #############################

function select_option {
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "   $1 "; }
    print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { read -s -n3 key 2>/dev/null >&2
                         if [[ $key = $ESC[A ]]; then echo up;    fi
                         if [[ $key = $ESC[B ]]; then echo down;  fi
                         if [[ $key = ""     ]]; then echo enter; fi; }

    for opt; do printf "\n"; done

    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - $#))

    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local selected=0
    while true; do
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ $idx -eq $selected ]; then
                print_selected "$opt"
            else
                print_option "${GREEN}$opt${NC}"
            fi
            ((idx++))
        done

        case `key_input` in
            enter) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done

    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    return $selected
}


################################# Menu #################################

function main {
    options=("➜ Start system" "✚ Install soft" "✖ Exit Menu") 

    select_option "${options[@]}"
    selected=$?

    if [ "$selected" = "0" ]; then

        update_linux
        install_soft
        install_zsh
        install_docker

    elif [ "$selected" = "1" ]; then
            soft_options=("➜ install base soft" "➜install zsh" "➜ install Docker" "➜ install Python3.11" "⬅ Back" "✖ Exit Menu")
            select_option "${soft_options[@]}"
            soft_selected=$?
            if [ "$soft_selected" = "0" ]; then
                update_linux
                install_soft
            elif [ "$soft_selected" = "1" ]; then
                update_linux
                install_zsh
            elif [ "$soft_selected" = "2" ]; then
                update_linux
                install_docker
            elif [ "$soft_selected" = "3" ]; then
                update_linux
                install_python
            elif [ "$soft_selected" = "4" ]; then
                main
            elif [ "$soft_selected" = "5" ]; then
                exit_menu
            fi

    elif [ "$selected" = "2" ]; then
        exit_menu
    fi
}

main