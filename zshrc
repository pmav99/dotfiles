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
alias treepy="tree ./ -C -v --dirsfirst -P '*.py|*.ini|*.conf|*.json' -I '*__pycache__|*.pyc'"
alias treedoc="tree ./ -C -v --dirsfirst -P '*.tex|*.html|*.rest|*.md|*.rst'"
alias treejs="tree ./ -C -v --dirsfirst -P '*.html|*.css|*.js'"

treex() {
    tree ./ -C -v --dirsfirst -P "*.$1"
}


# Python Template files
alias pyinit="cp $CONFIGURATION_FOLDER/templates/pyinit.py $1"
alias pymain="cp $CONFIGURATION_FOLDER/templates/pymain.py $1"
alias pyskel="cp $CONFIGURATION_FOLDER/templates/pyskel.py $1"
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
            *.tar) c=(bsdtar xvf);;
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

# skype hack
export PULSE_LATENCY_MSEC=60

# A quick httpserver. You can define the port (defaults to 8000). E.g.:
# httpserver 8080
httpserver() {
    python -m SimpleHTTPServer $1 || python -m http.server $1
}

# a pretty print command. Works with xml and json.
pprint() {
    local c i

    (($#)) || return

    for i; do
        c=''

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.xml)  c=(xmllint --format);;
            *.json) c=(python -m json.tool);;
            *)      echo "$0: unrecognized file extension: \`$i'" >&2
                    continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

# Archlinux compiles vim only with python2 support. There is no official way to have two versions
# of vim installed (i.e. one compiled with python2 and one with python3). So, we use
# https://aur.archlinux.org/packages/gv/gvim-python3-noconflict/
alias vim='/usr/bin/launch-python-vim.sh'
alias gvim='/usr/bin/launch-python-gvim.sh'
alias vim2='/usr/bin/vim'
alias vim3='/opt/gvim-python3-noconflict/bin/vim'
alias gvim2='/usr/bin/gvim'
alias gvim3='/opt/gvim-python3-noconflict/bin/gvim'
