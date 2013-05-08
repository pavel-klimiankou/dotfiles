#!/bin/bash
##################
# Create symlinks from .files to ones in repository
##################

target=~/dotfiles
backup=~/dotfiles_old

symlinks="vimrc bashrc vim"

echo "Create backup folder"
mkdir $backup
echo "ok"

cd $target

for file in $symlinks; do
	echo "backup .$file"
	mv -v ~/.$file $backup/
	echo "create link to $file"
	ln -s $target/$file ~/.$file
	echo "ok"
done

echo "Append bashrc to .profile"
cat $target/bashrc >> ~/.profile
echo "ok"

cd -

echo "Completed."
