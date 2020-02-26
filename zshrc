unset GREP_OPTIONS && GREP_OPTIONS="--color=auto"
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="spaceship"
source $ZSH/oh-my-zsh.sh
plugins=(zsh-completions zsh-syntax-highlighting git python)
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
