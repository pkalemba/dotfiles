# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
$HOME/.local/bin/gpg-agent-relay start
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

plugins=( zsh-completions zsh-syntax-highlighting git python tmux sudo )
export ZSH_TMUX_FIXTERM=xterm-256color
export ZSH_TMUX_AUTOSTART=true
unset GREP_OPTIONS && GREP_OPTIONS="--color=auto"
export ZSH=$HOME/.oh-my-zsh
#export ZSH_THEME="spaceship"
export ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
export UPDATE_ZSH_DAYS=3
alias vim=nvim
alias nano=nvim
alias fuu='sudo `fc -n -l -1`'
alias cp="rsync -ah --progress"
function cd {
    builtin cd "$@" && ls -F
    }
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf "$1"    ;;
            *.tar.gz)    tar xvzf "$1"    ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xvf "$1"     ;;
            *.tbz2)      tar xvjf "$1"    ;;
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
function authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
    < ~/.ssh/id_rsa.pub
}
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.dotfiles/zsh_aliases ] && source ~/.dotfiles/zsh_aliases
[ -f `which bat` ] && alias cat=bat
[ -f `which exa` ] && alias ls=exa
[ -z "$TMUX" ] && neofetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $HOME/.cargo/env
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:/home/pkalemba/go/bin:$PATH"
