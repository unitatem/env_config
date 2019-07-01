#!/bin/bash

# ~/.emacs.d
ln -s $(pwd)/emacs ~/.emacs.d

# ~/bin
ln -s $(pwd)/bin ~/bin

# ~/desktop
cd
mv Desktop desktop

# ~/documents
cd
rm -r Documents
ln -s Dropbox/disk_backup/documents

# ~/downloads
cd
mv Downloads downloads

# ~/store
cd
mkdir store

# ~/working_directory
cd
mkdir working_directory

# clean HOME dir
rm -r Music
rm -r Pictures
rm -r Templates
rm -r Videos

# edit this file
cd
emacs .config/user-dirs.dirs
killall nautilus
