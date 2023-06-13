setopt extended_glob

autoload -Uz compinit
compinit

# Clone antidote if necessary.
[[ -e ${ZDOTDIR:-$HOME}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh

antidote load

### Spaceship prompt setup

SPACESHIP_PROMPT_ORDER=(python user host dir git exec_time line_sep jobs exit_code char)

SPACESHIP_PROMPT_DEFAULT_PREFIX=" "
SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "
SPACESHIP_PROMPT_ADD_NEWLINE=false

SPACESHIP_CHAR_SYMBOL="$"
SPACESHIP_CHAR_COLOR_SUCCESS="blue"
SPACESHIP_CHAR_SUFFIX=" "

SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX=""
SPACESHIP_HOST_SUFFIX=""
SPACESHIP_HOST_COLOR="green"

SPACESHIP_DIR_PREFIX=":"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_COLOR="yellow"
SPACESHIP_GIT_PREFIX=""

SPACESHIP_USER_SUFFIX="@"

SPACESHIP_PYENV_SUFFIX="  "

# sample powerline characters for c'n'p
# 
# 
# 
# 
# 
# 
# 

### aliases and stuff

alias tmux="tmux -2"

precmd () {
    print -Pn "\e]0;${HOST}:${PWD/$HOME/\~}\a"
}

unsetopt share_history

