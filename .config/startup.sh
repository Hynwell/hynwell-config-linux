#!/bin/bash

#root
#read -p "Введите название учетной записи для добавление в sudo " USERNAME
#usermod -aG sudo "${USERNAME}"
#echo "${USERNAME}   ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/myconfig

#user
#echo "---Linux UPDATE---"
sudo apt update && sudo apt upgrade -y

#echo "---Install default software---"
for software_list in git zsh lsd bat dust duf procs dog fd gtop curlie micro screen tldr curl 
	do
		sudo apt install $software_list -y
	done

#echo "---Install ZSH---"
sudo apt install zsh -y

mkdir -p ~/.config/zsh/plugins/
curl https://raw.githubusercontent.com/Hynwell/hynwell-config-linux/main/.zshrc > ~/.zshrc
curl https://raw.githubusercontent.com/Hynwell/hynwell-config-linux/main/.config/zsh/.p10k.zsh > ~/.config/zsh/.p10k.zsh
curl https://raw.githubusercontent.com/Hynwell/hynwell-config-linux/main/.config/zsh/.alias > ~/.config/zsh/.alias

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
git clone git@github.com:marlonrichert/zsh-autocomplete.git ~/.config/zsh/plugins/zsh-autocomplete
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/plugins/zsh-syntax-highlighting
chsh --shell /bin/zsh $USER

#echo "---Install Docker---"
for software_list_for_docker in ca-certificates gnupg lsb-release
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



#ssh-keygen -t rsa -b 4096 -C "github@gmail.com"
#cat .ssh/id_rsa.pub 







