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

# ZSH ONLY!!!
# Make ls use natural sort
alias ls="${aliases[ls]:-ls} -v"

# disable AUTO_CD
unsetopt AUTO_CD

# Customize to your needs...
DOTFILES_DIR="$HOME/.dotfiles"

# aliases
alias ping='ping -4'
alias ping8='ping -c3 8.8.8.8'
alias pingg='ping -c3 www.google.com'
alias mmv='noglob zmv -W'

alias gtar='tar pcvzf'
alias btar='tar pcvjSf'
alias untar='tar xvf'
alias ungtar='tar xvzf'
alias unbtar='tar xvjf'

# Journalctl aliases
alias jctl=journalctl
alias jspy='jctl -f'

# Systemctl aliases
alias reload='sudo systemctl reload'
alias restart='sudo systemctl restart'
alias start='sudo systemctl start'
alias sctl='sudo systemctl'
alias status='systemctl -l status'
alias stop='sudo systemctl stop'

# docker
alias dc='docker-compose'
alias dm='docker-machine'
alias dockviz='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz images -t'

dtest() {
    if [ ! -z $1 ]
    then
        docker run --rm -it $1 /bin/bash
    else
        echo 'Please provide an image!'
    fi
}

d14() {
    if [ ! -z $1 ]
    then
        echo $@
        docker run --rm $@ -it d14:latest
    else
        docker run --rm -it d14:latest
    fi
}

d16() {
    if [ ! -z $1 ]
    then
        echo $@
        docker run --rm $@ -it d16:latest
    else
        docker run --rm -it d16:latest
    fi
}

dvolume() {
    if [ ! -z $1 ]
    then
        docker run --rm -v $1:/volume -it d14:latest
    else
        echo 'Please provide a volume!'
    fi
}

alias cputemp="watch -n 1 -d sensors"

hadolint() {
    if [ ! -z $1 ]
    then
        docker run --rm -i lukasmartinelli/hadolint < $1
    else
        docker run --rm -i lukasmartinelli/hadolint < Dockerfile
    fi
}

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Prog/venvs

## Python aliases
alias pw="pew workon"
alias jn="jupyter notebook"
alias rmpyc="find ./ -name '*.pyc' -delete"
alias rmtex="find . -type f \( -name '*.aux' -o -name '*.glo' -o -name '*.idx' -o -name '*.log' -o -name '*.toc' -o -name '*.ist' -o -name '*.acn' -o -name '*.acr' -o -name '*.alg' -o -name '*.bbl' -o -name '*.blg' -o -name '*.dvi' -o -name '*.glg' -o -name '*.gls' -o -name '*.ilg' -o -name '*.ind' -o -name '*.lof' -o -name '*.lot' -o -name '*.maf' -o -name '*.mtc' -o -name '*.thm' -o -name '*.nav' -o -name '*.snm' -o -name '*.out' -o -name '*.synctex.gz' -o -name '*.mtc1' -name '*.bcf' -name '*.fls' -name '*.run.xml' \) -delete"

# Tree aliases
treex()   { tree ${1:-./} -C -v --dirsfirst -P "*.$1" }
treepy()  { tree ${1:-./} -C -v --dirsfirst -P '*.py|*.ini|*.cfg|*.conf|*.json|*.html|*.jinja' -I '*__pycache__|*.pyc' }
treejs()  { tree ${1:-./} -C -v --dirsfirst -P '*.html|*.css|*.js' }
treedoc() { tree ${1:-./} -C -v --dirsfirst -P '*.tex|*.html|*.rest|*.md|*.rst' }

# Python Template files
alias pyinit="cp $DOTFILES_DIR/templates/pyinit.py $1"
alias pymain="cp $DOTFILES_DIR/templates/pymain.py $1"
alias pyskel="cp $DOTFILES_DIR/templates/pyskel.py $1"
alias pytest="cp $DOTFILES_DIR/templates/pytest.py $1"

# Bootstrap
alias bootstrap="cp $DOTFILES_DIR/templates/bootstrap.html $1"

# Get weather on CLI!
weather() {
    if [ ! -z $1 ]
    then
        curl -4 http://wttr.in/$1
    else
        curl -4 http://wttr.in/Rethymno
    fi
}

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
            *.tar.bz) c=(bsdtar xvf);;
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
    python2 -m SimpleHTTPServer $1 || python3 -m http.server $1
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

myip() {
    if which dig &> /dev/null; then
        dig +short myip.opendns.com @resolver1.opendns.com
    else
        curl -s http://whatismyip.akamai.com/
    fi
}

mylocalip() {
    python -c "import socket; print(socket.gethostbyname(socket.gethostname()))"
}

openports() {
    watch -n 1 -d -x sudo netstat -lntpu
}

### Append folders to PATH
# custom scripts
path+=("$DOTFILES_DIR/bin/")

# Texlive
path+=("/usr/local/texlive/2016/bin/x86_64-linux")
export INFOPATH=$INFOPATH:/usr/local/texlive/2016/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2016/texmf-dist/doc/man

# ruby gems
path+=$(ruby -rubygems -e "puts Gem.user_dir")/bin

# added by travis gem
[ -f /home/feanor/.travis/travis.sh ] && source /home/feanor/.travis/travis.sh
# NTFY notifications
if which ntfy  &> /dev/null; then
    eval "$(ntfy shell-integration)"
fi

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export PIP_WHEEL_DIR=~/.wheelhouse
export PIP_FIND_LINKS=~/.wheelhouse
export JAVA_OPTS="-Xmx2048M -Xms32M"
export GOPATH=~/Prog/go
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

