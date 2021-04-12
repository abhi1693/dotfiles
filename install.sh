#!/usr/bin/env sh

# Update apt repo
sudo apt update
# Upgrade system
sudo apt upgrade -y
sudo apt autoremove -y

# Install arbitrary software
sudo apt install apt-transport-https ca-certificates curl git gnupg-agent software-properties-common wget -y

# Install zsh
sudo apt install zsh -y
# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cp .zshrc "$HOME"
cp .zshenv "$HOME"

# Make sure sudo is password-less
if sudo -lU "$USER" grep -xqFe "$USER ALL=(ALL) NOPASSWD:ALL" /etc/sudoers; then
  echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
fi

# Install nvm
if [ ! -d "${HOME}/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi

# Install docker
which docker
if [ "$?" -ne 0 ]; then
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  sudo usermod -aG docker "$USER"
  rm get-docker.sh
fi

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install make
sudo apt install make -y

# Install gcc and g++
sudo apt install gcc g++ -y

# Install helm
which helm
if [ "$?" -ne 0 ]; then
  sudo snap install helm --classic
fi
