# basic zsh things

setopt extended_glob

autoload -Uz compinit
compinit

# set terminal title
title_string=""
if [ ! -z ${SSH_TTY} ]; then
    title_string+="%n@%m:"
fi
title_string+="%~"
case ${TERM} in
    xterm*|screen*)
        precmd () {print -Pn "\e]0;${title_string}\a"}
        ;;
esac

# start keychain if installed
# add other keys if necessary
[[ $(command -v keychain) ]] && eval `keychain --eval id_rsa`

# fetch antidote if necessary and load it

[[ -e ${ZDOTDIR:-$HOME}/.antidote ]] ||
  git clone https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh

antidote load

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# aliases

alias tmux="tmux -2"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# basic zsh things that for some reason need to happen at the end

unsetopt sharehistory

# finally deduplicate PATH, keeps the first seen entry for each dir
#export PATH=$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')
