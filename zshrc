# SETUP
# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
plugins=(asdf git bundler)
source $ZSH/oh-my-zsh.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# tmux
if [[ ! $TERM =~ screen ]]; then
  exec tmux
fi

# vim
export EDITOR='vim'
