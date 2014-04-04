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
        " There are essentially two options. Haven't researched yet which one is superior
        " Bundle 'bling/vim-airline'
        Bundle 'bling/vim-airline'
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
        Bundle 'Valloric/YouCompleteMe'

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

    " Various unused {
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
        "Bundle 'tpope/vim-fugitive'
        "
    " }

    " General Programming {
        " Code completion. Simply Neocomplecache rules!!!

        Bundle 'sukima/xmledit'
        Bundle 'chase/vim-ansible-yaml'
        "Bundle 'ervandew/supertab'
        " Source support_function.vim to support snipmate-snippets.
        "if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
            "source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
        "endif

        "Bundle 'godlygeek/tabular'
        "if executable('ctags')
            "Bundle 'majutsushi/tagbar'
        "endif
    " }

    " Python {
        if has('python')
            " Pick either python-mode or pyflakes & pydoc
            Bundle 'klen/python-mode'

            " python-mode {
                source $CONFIGURATION_FOLDER/vim/python-mode.vim
            " }

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

    " latex {
        "Bundle 'latex-box-team/latex-box'
    " }

    " misc {
        "Bundle 'spf13/vim-markdown'
        "Bundle 'spf13/vim-preview'
        "Bundle 'tpope/vim-cucumber'
        "Bundle 'puppet-syntax-highlighting'
    " }
" }

" Plugins {

    " Misc {
        let b:match_ignorecase = 1
    " }

     "OmniComplete {
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

        " some convenient mappings
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

        " automatically open and close the popup menu / preview window
        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        set completeopt=menu,preview,longest
    " }

    " Neocomplecache {
        " Disable AutoComplPop.
        "let g:acp_enableAtStartup = 0
        " Use neocomplcache.
        "let g:neocomplcache_enable_at_startup = 1
        " Use smartcase.
        "let g:neocomplcache_enable_smart_case = 1
        " Use camel case completion.
        "let g:neocomplcache_enable_camel_case_completion = 1
        " Use underbar completion.
        "let g:neocomplcache_enable_underbar_completion = 1
        " Set minimum syntax keyword length.
        "let g:neocomplcache_min_syntax_length = 3
        "let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

        " Define dictionary.
        "let g:neocomplcache_dictionary_filetype_lists = {
            "\ 'default' : '',
            "\ 'vimshell' : $HOME.'/.vimshell_hist',
            "\ 'scheme' : $HOME.'/.gosh_completions'
            "\ }

        " Define keyword.
        "if !exists('g:neocomplcache_keyword_patterns')
        "let g:neocomplcache_keyword_patterns = {}
        "endif
        "let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        "imap <C-k>     <Plug>(neocomplcache_snippets_expand)
        "smap <C-k>     <Plug>(neocomplcache_snippets_expand)
        "inoremap <expr><C-g>     neocomplcache#undo_completion()
        "inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " SuperTab like snippets behavior.
        "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
        " <TAB>: completion.
        "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        "inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        "inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
        "inoremap <expr><C-y>  neocomplcache#close_popup()
        "inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " AutoComplPop like behavior.
        "let g:neocomplcache_enable_auto_select = 1

        " Shell like behavior(not recommended).
        "set completeopt+=longest
        "let g:neocomplcache_enable_auto_select = 1
        "let g:neocomplcache_disable_auto_complete = 1
        "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
        "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

        " Enable omni completion.
        "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion.
        "if !exists('g:neocomplcache_omni_patterns')
        "let g:neocomplcache_omni_patterns = {}
        "endif
        "let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        "let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        "let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        "let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
    " }

    " Neocomplecache Snippets {
        " Setting the author var
        " If forking, please overwrite in your .vimrc.local file
        "let g:snips_author = 'Panagiotis Mavrogiorgos <pmav99@gmail.com>'
    " }

    " Ctags {
        set tags=./tags;/,~/.vimtags
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        "au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        "nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " Tabularize {
        "if exists(": Tabularize")
          "nmap <Leader>a= :Tabularize /=<CR>
          "vmap <Leader>a= :Tabularize /=<CR>
          "nmap <Leader>a: :Tabularize /:<CR>
          "vmap <Leader>a: :Tabularize /:<CR>
          "nmap <Leader>a:: :Tabularize /:\zs<CR>
          "vmap <Leader>a:: :Tabularize /:\zs<CR>
          "nmap <Leader>a, :Tabularize /,<CR>
          "vmap <Leader>a, :Tabularize /,<CR>
          "nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
          "vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

          "" The following function automatically aligns when typing a
          "" supported character
          "inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

          "function! s:align()
              "let p = '^\s*|\s.*\s|\s*$'
              "if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
                  "let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
                  "let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
                  "Tabularize/|/l1
                  "normal! 0
                  "call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
              "endif
          "endfunction

        "endif
     " }

     " Sessionman List {
        "set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        "nmap <leader>sl :SessionList<CR>
        "nmap <leader>ss :SessionSave<CR>
     " }

     " Buffer explorer {
        "nmap <leader>b :BufExplorer<CR>
     " }

     " JSON {
        "nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
     " }


     " ctrlp {
        "let g:ctrlp_working_path_mode = 2
        "nnoremap <silent> <D-t> :CtrlP<CR>
        "nnoremap <silent> <D-r> :CtrlPMRU<CR>
        "let g:ctrlp_custom_ignore = {
            "\ 'dir':  '\.git$\|\.hg$\|\.svn$',
            "\ 'file': '\.exe$\|\.so$\|\.dll$' }
     "}

     " TagBar {
        "nnoremap <silent> <leader>tt :TagbarToggle<CR>
     "}

" }
