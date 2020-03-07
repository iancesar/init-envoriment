#!/bin/bash

#VSCODE Extensions 51a22222ed19f23e57b7fd122116c7d3


echo "Criando diretórios"
mkdir -p /home/ian/Dev/Java /home/ian/Dev/Node /home/ian/Dev/Docker /home/ian/Dev/ReactNative /home/ian/Dev/Flutter

cd /home/ian/init-envoriment

echo "Atualizando os repositórios"
apt-get update

echo "Instalando Curl e Wget"
apt-get install -y curl
apt-get install -y wget


echo "Instalando OpenJDK 8" 

apt-get remove openjdk*
apt-get remove --auto-remove openjdk*
apt-get purge openjdk*
apt-get purge --auto-remove openjdk*

add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install -y openjdk-8-jdk

echo "Instalando Google Chrome"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install -y ./google-chrome-stable_current_amd64.deb

echo "Instalando Postman"

wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
tar -xvzf postman-linux-x64.tar.gz -C /opt
ln -s /opt/Postman/Postman /usr/bin/postman
cat << EOF > ~/.local/share/applications/postman2.desktop
[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/opt/Postman/Postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;
EOF

echo "Instalando VS Code"

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
apt install -y ./vscode.deb

echo "Instalando SUBLIME"

echo "deb https://download.sublimetext.com/ apt/stable/" |  tee /etc/apt/sources.list.d/sublime-text.list
echo "deb https://download.sublimetext.com/ apt/dev/" |  tee /etc/apt/sources.list.d/sublime-text.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg |  apt-key add -
apt-get update
apt-get install -y sublime-text


echo "Instalando GIT"
apt install -y git

echo "Instalando Git Ahead"
wget "https://github.com/gitahead/gitahead/releases/download/v2.6.1/GitAhead-2.6.1.sh" -O gitahead.sh
sh gitahead.sh

echo "Instalando DBeaver"
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O DBeaver.deb
apt install -y ./DBeaver.deb

echo "Instalando Docker e Docker Compose"
apt-get update
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
cat /etc/apt/sources.list.d/additional-repositories.list 
deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
apt-get update
apt-get -y  install docker-ce docker-compose

gpasswd -a $USER docker

echo "Instalando o STS"
wget https://download.springsource.com/release/STS4/4.5.1.RELEASE/dist/e4.14/spring-tool-suite-4-4.5.1.RELEASE-e4.14.0-linux.gtk.x86_64.tar.gz -O STS.tar.gz
tar -xvzf STS.tar.gz -C /home/ian/Dev/Java

echo "Instalando o Maven"
apt-get install -y maven

reboot
