#!/bin/sh

rm -f ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

rm -f ~/.zprofile
ln -s ~/dotfiles/.zprofile ~/.zprofile

rm -f ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json
