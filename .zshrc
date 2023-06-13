# basic zsh things

setopt extended_glob

autoload -Uz compinit
compinit

unsetopt share_history

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
