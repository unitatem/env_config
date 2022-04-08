#!/bin/bash

set -e
# SHELL_SUDO
# SHELL_INSTALL_TERMINAL
# SHELL_CREATE_SYMLINK

if [ -z ${SHELL_INSTALL_SUDO+x} ]; then SHELL_INSTALL_SUDO=sudo; fi


# Resources
# https://ivanaugustobd.medium.com/your-terminal-can-be-much-much-more-productive-5256424658e8

$SHELL_SUDO apt-get update

# Install terminal
if [ ! -z ${SHELL_INSTALL_TERMINAL+x} ]; then
	$SHELL_SUDO apt-get install tilix
fi

# Install zsh
$SHELL_SUDO apt-get -y install zsh
# Install oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /tmp/install.sh
cd
export ZSH=~/projects/oh-my-zsh
export ZSH_CUSTOM=$ZSH/custom
sh /tmp/install.sh --unattended
cd -


# Install plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# use CTRL+T to search for files
git clone --depth 1 https://github.com/junegunn/fzf.git ~/projects/fzf && ~/projects/fzf/install
$SHELL_SUDO gem install colorls

# Install themes
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Install fonts
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#license
wget -O /tmp/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip /tmp/Hack.zip -d /tmp/Hack
mkdir -p .local/share/fonts/
cp /tmp/Hack/* .local/share/fonts/.
fc-cache -f -v


if [ -z ${SHELL_CREATE_SYMLINK+x} ]; then
	echo "Symlink zshrc file in the repository to the ~/.zshrc"
else
	rm -f $HOME/.zshrc
	ln -s $PWD/zshrc $HOME/.zshrc
	ln -s $PWD/p10k.zsh $HOME/.p10k.zsh
fi

echo "Run zsh :)"
