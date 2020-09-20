#!/bin/bash

# this works on both ubuntu and macos
THIS_SCRIPT="`perl -MCwd -le 'print Cwd::abs_path shift' "${0}"`"
THIS_DIR="`dirname "${THIS_SCRIPT}"`"

for DOTFILE in gitconfig bashrc bash_aliases vim vimrc Xresources zshrc
do
  DEST="${HOME}/.${DOTFILE}"
  if [ -e "${DEST}" ]
  then
    if [ -L "${DEST}" ]
    then
      rm -v "${DEST}"
    else
      mv -v "${DEST}" "${HOME}/${DOTFILE}.saved.`date +%s`"
    fi
  fi
  ln -sv "${THIS_DIR}/${DOTFILE}" "${DEST}"
  echo ""
done
