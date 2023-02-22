#!/bin/bash

# Обновление linux
#echo "---Linux update---"
#sudo apt update && apt upgrade -y

# Установка стандартного набора
#echo "---Install default software---"
#for software_list in git zsh lsd bat dust duf procs dog fd gtop curlie micro screen tldr curl 
#	do
#		sudo apt install $software_list -y
#	done

# Установка Docker'а и сопутствующих
#echo "---Install Docker---"

# Дополнения и настройка для ZSH
#curl https://raw.githubusercontent.com/AdamsGH/linux_config/main/.zshenv > ~/.zshenv
#mkdir -p  ~/.config/zsh
#curl https://raw.githubusercontent.com/AdamsGH/linux_config/main/.config/zsh/.zshrc > ~/.config/zsh/.zshrc
#curl https://raw.githubusercontent.com/AdamsGH/linux_config/main/.config/zsh/.alias.zsh > ~/.config/zsh/.alias.zsh
#curl https://raw.githubusercontent.com/AdamsGH/linux_config/main/.config/zsh/.p10k.zsh > ~/.config/zsh/.p10k.zsh
#chsh --shell /bin/zsh $USER
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k


#root
#apt install sudo git
#read -p "Введите название учетной записи для добавление в sudo " USERNAME
#usermod -aG sudo "${USERNAME}"
#echo "${USERNAME}   ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/myconfig

#user
#sudo apt update && sudo apt upgrade -y
#sudo apt install zsh





