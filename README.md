dotfiles
========

My dotfiles (with an install script) for installing [zprezto](https://github.com/sorin-ionescu/prezto)

```
curl -O https://raw.githubusercontent.com/pmav99/dotfiles/master/install.sh

zsh ./install.sh
```

Afterwards, open vim and run

```
:BundleInstall
```

Finally you have to compile `YouCompleteMe`.

```
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```

