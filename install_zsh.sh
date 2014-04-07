#!/usr/bin/zsh

########## Variables
prezto_url="https://github.com/sorin-ionescu/prezto/archive/master.zip"
prezto_dir=~/.zprezto
dot_dir=~/.dotfiles
dot_url=https://github.com/pmav99/dotfiles
old_dir=~/.dotfiles_old
custom_prompt=prompt_panos_setup
##########


# Cleaning up
rm -rf ${prezto_dir}

# download the prezto zip file
print "1. Cloning prezto to ${prezto_dir}."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${prezto_dir}"
print "   Done\n"


# clone git repo
if [[ -d $dot_dir/.git ]]; then
    print "2. $dot_dir exists. Pulling changes"
    cd $dot_dir; git pull; cd
else
    print "2. $dot_dir does not exist. Cloning."
    git clone $dot_url $dot_dir
fi
print "Done\n"

print "3. Creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
print "   Done\n"

print "4. Backup the existing prezto dotfiles in homedir to $old_dir directory"
print "   and then create symlinks of the default prezto files from the"
print "   prezto installation folder to ~."
setopt EXTENDED_GLOB
for filename in $prezto_dir/runcoms/^README.md(.N); do
    print "       Processing: $filename"
    if ls ~/.${filename:t} &> /dev/null; then
        mv ~/.${filename:t} $old_dir
    fi
    ln -s "$filename" "${ZDOTDIR:-$HOME}/.${filename:t}"
done
print "   Done\n"

print "5. Replace prezto dotfiles with custom version from $dot_dir directory."
print "   This operation will remove the default prezto files."
for filename in $dot_dir/z*; do
    print "      Processing: $filename"
    if ls ~/.${filename:t} &> /dev/null; then
        rm ~/.${filename:t}
    fi
    ln -s $filename ~/.${filename:t}
done
print "   Done\n"

print "6. Install custom theme."
ln -s $dot_dir/$custom_prompt $prezto_dir/modules/prompt/functions/
print "   Done"

print ""
print "Finished"
print "Log out and log in again and you shall be ready to go!"
