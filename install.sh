#!/usr/bin/env sh

# Update apt repo
sudo apt update
# Upgrade system
sudo apt upgrade -y
sudo apt autoremove -y

# Install arbitrary software
sudo apt install apt-transport-https ca-certificates curl git gnupg-agent software-properties-common wget  -y

# Install zsh
sudo apt install zsh -y
# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cp .zshrc "$HOME"
cp .zshenv "$HOME"

# Make sure sudo is password-less
if sudo -lU $USER grep -xqFe "$USER ALL=(ALL) NOPASSWD:ALL" /etc/sudoers
then
  echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
fi