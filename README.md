dotfiles
========

Install prezto/vim + customizations really fast!

Requirements
------------

* `zsh`
* `wget` or `curl`
* `unzip`

ZSH
---

To install zsh, use the following:

```
curl -O https://raw.githubusercontent.com/pmav99/dotfiles/master/install_zsh.sh

zsh ./install_zsh.sh
```

VIM
---


```
curl -O https://raw.githubusercontent.com/pmav99/dotfiles/master/install_vim.sh

zsh ./install_vim.sh
```

Afterwards, open vim and run

```
:BundleInstall
```

or alternatively run on the command line this command:

    vim +BundleInstall +qall

Finally you may want to compile `YouCompleteMe`.

```
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```

Updating
--------

If you need to update `prezto`, just check out the repository and rerun the install scripts!
