#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
YUM_CMD=$(which yum)
APT_GET_CMD=$(which apt)
if [[ ! -z $YUM_CMD ]]; then
    sudo yum install zsh tmux curl
elif [[ ! -z $APT_GET_CMD ]]; then
    sudo apt install zsh tmux curl wget python3 python3-pip  -y
else
    echo "error can't install package zsh"
    exit 1;
 fi

if [ "$(uname)" == "Darwin" ]; then
	# Check if Homebrew is installed
	if [ ! -f "`which brew`" ]; then
	  echo 'Installing homebrew'
	  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
	  echo 'Updating homebrew'
	  brew update
	fi
	brew tap homebrew/bundle  # Install Homebrew Bundle
	# Check if Mac-CLI is installed
	if [ ! -f "which mac" ]; then
	    echo 'Installing Mac-CLI'
	    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install)"
	else
	    echo 'Updating Mac-CLI'
	    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/update)"
	fi
	brew install zsh tmux
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
