#!/usr/bin/zsh

########## Variables
prezto_dir=~/.prezto
dot_dir=~/dotfiles
old_dir=~/dotfiles_old

files="bashrc vimrc zshrc zpreztorc"
##########

print "1. Creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
print "   Done"

print "2. Clone our custom repository to $dot_dir."
git clone https://github.com/pmav99/dotfiles $dot_dir
print "   Done"

print "3. Cloning the prezto repository to $prezto_dir"
git clone --recursive https://github.com/sorin-ionescu/prezto.git $prezto_dir
print "   Done"

print "4. Backup the existing prezto dotfiles in homedir to $old_dir directory"
print "   and then create symlinks of the default prezto files from the"
print "   prezto installation folder to ~."
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    mv ~/.${rcfile:t} ~/dotfiles_old/
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
print "   Done"

print "5. Replace prezto dotfiles with custom version from $dir directory."
print "   This operation will remove the default prezto files."
for filename in $dot_dir/z*; do
    print "      Processing:   $filename"
    rm ~/.${filename:t}
    ln -s $filename ~/.${filename:t}
done
print "   Done"

print "6. Vim !"
mv ~/.vimrc ~/dotfiles_old/
ln -s $dot_dir/vim/vimrc-linux.vim ~/.vimrc 
done
print "   Done"

#
# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
#for file in $files; do
#echo "Moving any existing dotfiles from ~ to $old_dir"
    #echo "Creating symlink to $file in home directory."
    #ln -s $dir/$file ~/.$file
#done
