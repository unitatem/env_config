#!/bin/bash

# Resources
# https://ivanaugustobd.medium.com/your-terminal-can-be-much-much-more-productive-5256424658e8


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
wget -O /tmp/Hack-Regular.ttf https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
mkdir -p .local/share/fonts/
cp /tmp/Hack-Regular.ttf .local/share/fonts/.
fc-cache -f -v


echo "Symlink zshrc file in the repo to the ~/.zshrc"

