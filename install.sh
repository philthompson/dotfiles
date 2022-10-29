#!/bin/bash

# this works on both ubuntu and macos
THIS_SCRIPT="`perl -MCwd -le 'print Cwd::abs_path shift' "${0}"`"
THIS_DIR="`dirname "${THIS_SCRIPT}"`"

DOTFILES_GREP_FILTER=".*"

if [ ! -z "${1}" ]
then
	DOTFILES_GREP_FILTER="^${1}$"
fi

# line breaks are embedded directly into the variable,
#   and the first line is skipped with awk below
DOTFILES="
gitconfig
bashrc
bash_aliases
vim
vimrc
Xresources
zshrc"

echo "${DOTFILES}" | awk 'NR>1' | grep "${DOTFILES_GREP_FILTER}" | while read DOTFILE
do
  echo "installing [${DOTFILE}] dotfile"
  DEST="${HOME}/.${DOTFILE}"
  if [ -e "${DEST}" ]
  then
    if [ -L "${DEST}" ]
    then
      rm -v "${DEST}"
    else
      mv -v "${DEST}" "${HOME}/${DOTFILE}.saved.`date +%Y-%m-%d-%H%M%S`"
    fi
  fi
  ln -sv "${THIS_DIR}/${DOTFILE}" "${DEST}"
  echo ""
done
