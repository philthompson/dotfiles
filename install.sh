#!/bin/bash

THIS_SCRIPT="`readlink -f "${0}"`"
THIS_DIR="`dirname "${THIS_SCRIPT}"`"

for DOTFILE in gitconfig bashrc bash_aliases vim vimrc Xresources
do
  DEST="${HOME}/.${DOTFILE}"
  if [ -f "${DEST}" ]
  then
    if [ -L "${DEST}" ]
    then
      rm "${DEST}"
    else
      mv "${DEST}" "${HOME}/${DOTFILE}.saved.`date +%s`"
    fi
  fi
  ln -sv "${THIS_DIR}/${DOTFILE}" "${DEST}"
done
