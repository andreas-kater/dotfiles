# SETUP
# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
# plugins=(asdf git)
plugins=(git)
source $ZSH/oh-my-zsh.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# disabling shell built-in command functions so I can use Google Cloud Functions emulator, which is also called with "functions"
disable r functions


#NVM node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#Java
export JAVA_HOME=/Library/Java/Home

# vim
export EDITOR='vim'

export PS1=">> "

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME:$PATH"
export PATH="$PATH:/usr/local/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andreaskater/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/andreaskater/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andreaskater/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/andreaskater/google-cloud-sdk/completion.zsh.inc'; fi