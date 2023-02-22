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

#chsh --shell /bin/zsh $USER



#root
apt install sudo git
read -p "Введите название учетной записи для добавление в sudo " USERNAME
usermod -aG sudo "${USERNAME}"
echo "${USERNAME}   ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/myconfig

#user
sudo apt update && sudo apt upgrade -y
sudo apt install zsh
ssh-keygen -t rsa -b 4096 -C "hynwellG@gmail.com"
cat .ssh/id_rsa.pub 
git init .
git remote add origin git@github.com:Hynwell/hynwell-config-linux.git
git pull origin main
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
git clone git@github.com:marlonrichert/zsh-autocomplete.git ~/.config/zsh/plugins/zsh-autocomplete
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting





