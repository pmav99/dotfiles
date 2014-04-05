#!/usr/bin/zsh

########## Variables
prezto_url="https://github.com/sorin-ionescu/prezto/archive/master.zip"
prezto_zip=/tmp/prezto-master.zip
prezto_tmp=/tmp/prezto-master
prezto_dir=~/.zprezto
dot_dir=~/dotfiles
old_dir=~/dotfiles_old
custom_prompt=prompt_panos_setup
##########


# Cleaning up
rm -rf ${prezto_zip}
rm -rf ${prezto_tmp}
rm -rf ${prezto_dir}

# download the prezto zip file
if (( $+commands[wget] )); then
    print "1. Downloading prezto using wget. Saving the zip file to ${prezto_zip}"
    wget --quiet -O ${prezto_zip} ${prezto_url}
elif (( $+commands[curl] )); then
    print "1. Downloading prezto using curl. Saving the zip file to ${prezto_zip}"
    curl --silent -L -o ${prezto_zip} ${prezto_url}
else
    print "In order to use the install scirpt you must install either 'curl' or 'wget'."
    print "Exiting"
    return 1
fi
print "   Done\n"

# unzip
print "2. Unziping prezto"
unzip -oq ${prezto_zip} -d /tmp
mv ${prezto_tmp} ${prezto_dir}
print "   Done\n"

print "3. Creating $old_dir for backup of any existing dotfiles in ~ ..."
mkdir -p $old_dir
print "   Done\n"

print "4. Clone our custom repository to $dot_dir."
git clone https://github.com/pmav99/dotfiles $dot_dir
print "   Done\n"

print "5. Backup the existing prezto dotfiles in homedir to $old_dir directory"
print "   and then create symlinks of the default prezto files from the"
print "   prezto installation folder to ~."
setopt EXTENDED_GLOB
for filename in $prezto_dir/runcoms/^README.md(.N); do
    print "       Processing: $filename"
    if ls ~/.${filename:t} &> /dev/null; then
        mv ~/.${filename:t} ~/dotfiles_old/
    fi
    ln -s "$filename" "${ZDOTDIR:-$HOME}/.${filename:t}"
done
print "   Done\n"

print "6. Replace prezto dotfiles with custom version from $dot_dir directory."
print "   This operation will remove the default prezto files."
for filename in $dot_dir/z*; do
    print "      Processing: $filename"
    if ls ~/.${filename:t} &> /dev/null; then
        rm ~/.${filename:t}
    fi
    ln -s $filename ~/.${filename:t}
done
print "   Done\n"

print "7. Install custom theme."
cp $dot_dir/$custom_prompt $prezto_dir/modules/prompt/functions/
print "   Done"

print ""
print "Finished"
print "Log out and log in again and you shall be ready to go!"
