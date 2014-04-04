#!/usr/bin/zsh

########## Variables
prezto_dir=~/.prezto
dot_dir=~/dotfiles
old_dir=~/dotfiles_old
##########

print "1.  Creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
print "    Done"

print "2.  Clone our custom repository to $dot_dir."
git clone https://github.com/pmav99/dotfiles $dot_dir
print "    Done"

print "3.  Cloning the prezto repository to $prezto_dir"
git clone --recursive https://github.com/sorin-ionescu/prezto.git $prezto_dir
print "    Done"

print "4.  Backup the existing prezto dotfiles in homedir to $old_dir directory"
print "    and then create symlinks of the default prezto files from the"
print "    prezto installation folder to ~."
setopt EXTENDED_GLOB
for filename in ~/.prezto/runcoms/^README.md(.N); do
    print "      Processing:   $filename"
    if ls ~/.${filename:t} &> /dev/null; then
        mv ~/.${filename:t} ~/dotfiles_old/
    fi
    ln -s "$filename" "${ZDOTDIR:-$HOME}/.${filename:t}"
done
print "    Done"

print "5.  Replace prezto dotfiles with custom version from $dot_dir directory."
print "    This operation will remove the default prezto files."
for filename in $dot_dir/z*; do
    print "      Processing:   $filename"
    if ls ~/.${filename:t} &> /dev/null; then
        rm ~/.${filename:t}
    fi
    ln -s $filename ~/.${filename:t}
done
print "   Done"

print "6.  Vim !"
print "6.a Handling vimrc"
if ls ~/.vimrc &> /dev/null; then
    mv ~/.vimrc ~/dotfiles_old/
fi
ln -s $dot_dir/vim/vimrc-linux.vim ~/.vimrc
print "6.b Handling Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
print "    Done"

print ""
print "Finished"
print "Log out and log in again and you shall be ready to go!"
