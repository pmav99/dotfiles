#!/usr/bin/zsh

########## Variables
dot_url=https://github.com/pmav99/dotfiles
dot_dir=$0:A:h
old_dir=~/.dotfiles_old
vundle_dir=~/.vim/bundle/vundle
vundle_url=https://github.com/gmarik/vundle.git
##########

print "1. Creating $old_dir for backup of any existing dotfiles in $HOME"
mkdir -p $old_dir
print "Done"

# clone git repo
if [[ -d $dot_dir/.git ]]; then
    print "2. $dot_dir exists. Pulling changes"
    cd $dot_dir; git pull; cd
else
    print "2. $dot_dir does not exist. Cloning."
    git clone $dot_url $dot_dir
fi
print "Done"

print "3. Install custom vimrc !"
if [[ -e ~/.vimrc ]] then
    print "Backup old .vimrc"
    mv ~/.vimrc $old_dir
fi
print "Create symlink."
ln -s $dot_dir/vim/vimrc ~/.vimrc
print "Done"

print "4. Clone NeoBundle"
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

print "Done"
