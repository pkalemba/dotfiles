#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt)
BREW_CMD=$(which brew)
if [[ ! -z $YUM_CMD ]]; then
    sudo yum install zsh tmux curl
elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt-get update
    sudo apt-get install zsh tmux curl wget python3 python3-pip  -y
else
    echo "error can't install package zsh"
    exit 1;
 fi

if [[ -z $BREW_CMD ]]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
	test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
brew install exa
brew install nvim
if [ -z ${WSL_DISTRO_NAME+x} ]; then
       	echo "Not using WSL"
else
       	echo "WSL Detected"
	sudo apt install libfontconfig1 libx11-xcb-dev libxcb-xkb-dev -y
fi


# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo 'Installing oh-my-zsh'
  /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo 'Updating oh-my-zsh'
  sh $OMZDIR/tools/upgrade.sh
fi
TPMDIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPMDIR" ]; then
  echo 'Installing Tmux Plugin Manager'
  mkdir -p $TPMDIR
  git clone https://github.com/tmux-plugins/tpm $TPMDIR
else
  echo 'Updating TPM'
  cd $TPMDIR;git pull origin master

fi
