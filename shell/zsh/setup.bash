#!/bin/bash

# Resources
# https://ivanaugustobd.medium.com/your-terminal-can-be-much-much-more-productive-5256424658e8


# Install terminal
sudo apt-get update
sudo apt-get install tilix

# Install zsh
sudo apt install zsh
# Install oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /tmp/install.sh && ZSH=~/projects/oh-my-zsh; sh /tmp/install.sh


# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# use CTRL+T to search for files
git clone --depth 1 https://github.com/junegunn/fzf.git ~/projects/fzf && ~/projects/fzf/install

# Install themes
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Install fonts
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#license
wget -O /tmp/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zipunzip Hack.zip -d /tmp/Hack
mkdir -p .local/share/fonts/
cp /tmp/Hack/* .local/share/fonts/.
fc-cache -f -v


echo "Symlink zshrc file in the repo to the ~/.zshrc"

