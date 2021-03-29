#settings the pure theme for zsh
fpath+=$HOME/.zsh/pure

#History in the cache directory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

#plugins 
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#for zsh syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

#suggest aliases for commands
source ~/.zsh/zsh-you-should-use/you-should-use.plugin.zsh

# aliases
alias zshconfig="vim ~/.zshrc"
alias vpn="protonvpn-cli c -f -p udp"
alias la="exa --long --all --group --header --group-directories-first"
alias ls="exa --long --group --header --group-directories-first"

alias cat="bat"
alias ps="~/Projects/scripts/procs/procs"
alias grep="rg"
alias ssh="kitty +kitten ssh"
alias cp="cp -i"
alias df="df -h"
alias jctl="journalctl -p 3 -xb"
alias projects="cd ~/Projects"
alias gs="git status"

#For kitty completion
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

#for pure zsh theme
autoload -U promptinit; promptinit
prompt pure

#Archive function 
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Load RVM into a shell session *as a function*

#for nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
