#!/usr/bin/bash

# Get Username
USERNAME="$USER"
echo "$USERNAME"

set -x

# Install ohmyzsh for user
echo "Installing for $USERNAME"
sh ohmyzsh.sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp -fv ~/git/config/.zshrc  ~/
cp -fv ~/git/config/.p10k.zsh ~/

# Install ohmyzsh for root
sudo bash <<EOF
cd ~/
cp -rv "/home/$USERNAME/git/config" .
sh config/ohmyzsh.sh
cp -r "/home/$USERNAME/.oh-my-zsh" .
cp -fv "config/.zshrc" .
cp -fv "config/.p10k.zsh" .
EOF
echo "
Restart Konsole to load changes or enter exec zsh"
