#!/usr/bin/zsh

########## Variables
prezto_dir=~/.prezto
dot_dir=~/dotfiles
old_dir=~/dotfiles_old

files="bashrc vimrc zshrc zpreztorc"
##########

print "1. Creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
print "done"

print "5. Clone our custom repository to $dot_dir."
git clone https://github.com/pmav99/dotfiles $dot_dir
print "done"

print "2. Cloning the prezto repository to $prezto_dir"
git clone --recursive https://github.com/sorin-ionescu/prezto.git $prezto_dir
print 'done'

print "3. Backup the existing prezto dotfiles in homedir to $old_dir directory"
print "   and then create symlinks of the default prezto files from the"
print "   prezto installation folder to ~."
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    mv ~/.${rcfile:t} ~/dotfiles_old/
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
print "done"

print "4. Replace prezto dotfiles with custom version from $dir directory."
print "   This operation will remove the default prezto files."
files="zshrc zpreztorc"
for file in $files; do
    rm "~/.$file"
    ln -s "~/.$rcfile" "$dot_dir/$rcfile"
done
print 'done'


# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
#for file in $files; do
#echo "Moving any existing dotfiles from ~ to $old_dir"
    #echo "Creating symlink to $file in home directory."
    #ln -s $dir/$file ~/.$file
#done


