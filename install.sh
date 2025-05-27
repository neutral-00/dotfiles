#!/bin/bash

# Ensure dotfiles directory exists
if [[ ! -d ~/dotfiles ]]; then
  echo "Error: ~/dotfiles directory not found!"
  exit 1
fi

# create symlinks (force overwrite)
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/nvim ~/.config/nvim

echo "Symlinks created successfully!"
