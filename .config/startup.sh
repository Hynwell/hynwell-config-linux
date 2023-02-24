#!/bin/bash

#root
#read -p "Введите название учетной записи для добавление в sudo " USERNAME
#usermod -aG sudo "${USERNAME}"
#echo "${USERNAME}   ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/myconfig

#user
echo "---LINUX UPDATE---"
sudo apt update && sudo apt upgrade -y


echo "---INSTALL SOFT---"
softwares_list=(git zsh bat gtop micro screen tldr curl) 
for software_list in ${softwares_list[@]}
	do
		sudo apt install ${software_list} -y
	done


echo "---INSTALL ZSH---"
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


echo "---INSTALL Docker---"
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

docker --version
docker compose version 


# install python3.11
read -p "Уставить pytnon3.11 (y/n?): " inpy
if [[ "$inpy" == "y" ]]; then

    echo "---DOWNLOAD SCRIPT---"

    git clone --quiet https://github.com/Hynwell/install-python3.11.git ~/scripts/install-python3.11
    chmod +x ~/scripts/install-python3.11/install-python3.11.sh
    ~/scripts/install-python3.11/install-python3.11.sh

elif [[ "$inpy" == "n" ]]; then
    echo "Отмена установки Python"
else
  echo "Выбранно не верное значение -> Отмена установки Python"
fi


# start ZSH
zsh

#ssh-keygen -t rsa -b 4096 -C "github@gmail.com"
#cat .ssh/id_rsa.pub 







