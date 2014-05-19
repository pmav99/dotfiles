#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
CONFIGURATION_FOLDER=~/.dotfiles


# aliases
alias ping8='ping -c3 8.8.8.8'
alias pingg='ping -c3 www.google.com'
alias mmv='noglob zmv -W'

# Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Prog/venvs
source $(which virtualenvwrapper.sh)

## Python aliases
# Remove *.pyc recursively starting from the current directory
alias rmpyc="find ./ -name '*.pyc' -delete"
# Show the tree folder for python projects
alias treepy="tree ./ -C -v --dirsfirst -P '*.py|*.tex|*.html'"

# Python Template files
alias pyinit="cp $CONFIGURATION_FOLDER/templates/pyinit.py $1"
alias pylog="cp $CONFIGURATION_FOLDER/templates/pylog.py $1"
alias pymainlog="cp $CONFIGURATION_FOLDER/templates/pymainlog.py $1"
alias pymain="cp $CONFIGURATION_FOLDER/templates/pymain.py $1"
alias pyskel="cp $CONFIGURATION_FOLDER/templates/pyskel.py $1"
alias pypackage="cp $CONFIGURATION_FOLDER/templates/pypackage.py $1"
alias pytest="cp $CONFIGURATION_FOLDER/templates/pytest.py $1"

# Bootstrap
alias bootstrap="cp $CONFIGURATION_FOLDER/templates/bootstrap.html $1"

# an extract command
x() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}



