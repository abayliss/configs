#!/bin/bash

TO_LINK=(
    ".bashrc-apb"
    ".zshrc"
    ".zsh_plugins.txt"
    ".p10k.zsh"
    ".screenrc"
    ".tmux.conf"
    ".vimrc"
)

for f in ${TO_LINK[@]}; do
    [[ ! -e ${HOME}/${f} ]] && ln --symbolic --target-directory=${HOME} $(realpath --relative-to=${HOME} ${f})
done

exit 0 # otherwise we might end up with a non-zero exit code if the last file in the list was already linked