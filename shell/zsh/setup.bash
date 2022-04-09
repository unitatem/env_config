#!/bin/bash

set -e
YES="Y"

if [ ! "$SHELL_I_HAVE_READ" = "$YES" ]; then
	echo -e '
	# Environment variables controlling installations process.
	# Set (or not set) before running setup script.
	# Key:                    Value Ubuntu  Value Centos  Comment
	# SHELL_I_HAVE_READ       Y             Y             Must be set to Y
	# SHELL_SUDO              sudo          ?
	# SHELL_PACKAGE_MANAGER   apt-get       yum
	# SHELL_INSTALL_TERMINAL  Y/N           Y/N
	# SHELL_INSTALL_COLORLS   Y/N           Y/N
	# SHELL_CREATE_SYMLINK    Y/N           Y/N
	'
	exit -1
fi

# Resources
# https://ivanaugustobd.medium.com/your-terminal-can-be-much-much-more-productive-5256424658e8

$SHELL_SUDO $SHELL_PACKAGE_MANAGER -y update

# Install terminal
if [ "$SHELL_INSTALL_TERMINAL" = "$YES" ]; then
	$SHELL_SUDO $SHELL_PACKAGE_MANAGER -y install tilix
fi

# Install zsh
$SHELL_SUDO $SHELL_PACKAGE_MANAGER -y install zsh
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
if [ "$SHELL_INSTALL_COLORLS" = "$YES" ]; then
	$SHELL_SUDO gem install colorls
fi

# Install themes
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Install fonts
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#license
wget -O /tmp/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip /tmp/Hack.zip -d /tmp/Hack
mkdir -p .local/share/fonts/
cp /tmp/Hack/* .local/share/fonts/.
fc-cache -f -v


if [ "$SHELL_CREATE_SYMLINK" = "$YES" ]; then
	rm -f $HOME/.zshrc
	ln -s $PWD/zshrc $HOME/.zshrc
	ln -s $PWD/p10k.zsh $HOME/.p10k.zsh
else
	echo "Symlink zshrc file in the repository to the ~/.zshrc"
	echo "Symlink p10k.zsh file in the repository to the ~/.p10k.zsh"
fi

echo "Run zsh :)"

