" Modeline and notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Setup Environment {
    " The following two lines are required by Vundle.
    set nocompatible        " be iMproved
    filetype off            " required!

    " Setup Vundle
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
" }

" Bundles {
    " Vundle {
        Bundle 'gmarik/vundle'
    " }

    " Colors and themes {
        Bundle 'altercation/vim-colors-solarized'
    " }

    " Powerline {
        " Airline is simpler and faster.
        Bundle 'bling/vim-airline'
        "Bundle 'bling/vim-airline'
        "Bundle 'Lokaltog/powerline'
        "set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
    " }

    " NerdTree - File Explorer {
        Bundle 'scrooloose/nerdtree'

        " Mappings
        " I like to open an explorer with Ctrl + E
        map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
        "map <leader>e :NERDTreeFind<CR>
        "nmap <leader>nt :NERDTreeFind<CR>

        " Options
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
    " }

    " Gundo - Undo Tree {
        " More info : http://sjl.bitbucket.org/gundo.vim/#usage
        Bundle 'sjl/gundo.vim'

        " Toggle gundo with F5
        nnoremap <F5> :GundoToggle<CR>
    " }

    " GIT {
        " More info here: https://github.com/tpope/vim-fugitive
        Bundle 'tpope/vim-fugitive'

    " }

    " Comments {
        " Select and press <leader> c <space>
        Bundle 'scrooloose/nerdcommenter'

        " Don't really remember what this does. I think it is safe to remove.
        "let g:NERDShutUp=1
    " }

    " Code completion {
        " https://github.com/Valloric/YouCompleteMe
        "Bundle 'Valloric/YouCompleteMe'

        " https://github.com/scrooloose/syntastic
        Bundle 'scrooloose/syntastic'
    " }

    " Snippets {
        " Two options. Choose one. If you need custom snippets just fork the snippets repos and
        " add them yourself.
        "
        " Neocomplcache
        "Bundle 'Shougo/neocomplcache.git'
        "Bundle 'Shougo/neocomplcache-snippets-complete'
        "
        " vim-snipmate
        "Bundle 'MarcWeber/vim-addon-mw-utils'
        "Bundle 'tomtom/tlib_vim'
        "Bundle 'garbas/vim-snipmate'
        "Bundle 'honza/vim-snippets'
    " }

    " Various {
        Bundle 'tpope/vim-repeat'
        Bundle 'tpope/vim-surround'
        "Bundle 'AutoClose'
        "Bundle 'kien/ctrlp.vim'
        "Bundle 'vim-scripts/sessionman.vim'
        Bundle 'vim-scripts/matchit.zip'
        "Bundle 'Lokaltog/vim-easymotion'
        "Bundle 'godlygeek/csapprox'
        "Bundle 'corntrace/bufexplorer'
        "Bundle 'airblade/vim-gitgutter'
        "
    " }

    " General Programming {

        Bundle 'sukima/xmledit'
        Bundle 'chase/vim-ansible-yaml'
        "Bundle 'spf13/vim-markdown'
        "Bundle 'spf13/vim-preview'
        "Bundle 'tpope/vim-cucumber'
        "Bundle 'puppet-syntax-highlighting'
        "Bundle 'ervandew/supertab'
        "Bundle 'godlygeek/tabular'
        "if executable('ctags')
            "Bundle 'majutsushi/tagbar'
        "endif
    " }

    " Python {
        if has('python')
            " Pick either python-mode or pyflakes & pydoc
            Bundle 'klen/python-mode'

            "" a two-way integration between vim and ipython 0.11+
            "Bundle 'ivanov/vim-ipython'

            "" an integrated debugging environment in vim.
            "Bundle 'jabapyth/vim-debug'

            "" awesome python autocompletion with vim
            "" (it was rather slow 11/2012)
            "Bundle 'davidhalter/jedi-vim'

            " Workon with virtualenvs
            Bundle 'jmcantrell/vim-virtualenv'

        endif
    " }

" }
