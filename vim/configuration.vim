" Modeline and notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" general {
    filetype plugin indent on   " automatically detect file types.
    syntax on                   " syntax highlighting
    set mouse-=a                " automatically disable mouse usage
    scriptencoding utf-8
    set encoding=utf-8
    set modelines=2
    set laststatus=2            " always show a status line
    set showmode                " display the current mode
    set showcmd                 " show partial commands in status line and
    set visualbell
    set ttyfast
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set backspace=indent,eol,start  " backspace for dummies
    set history=1000            " Store a ton of history (default is 20)
    set shell=/bin/zsh
    set fillchars=diff:⣿,vert:│
    set autowrite               " Autosave files
    set title
" }

" Basic stuff {
    let mapleader = ','
    let maplocalleader = '\\'

    " Swap ; and :  Convenient.
    " Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " map F1 (help) to esc
    inoremap <F1> <ESC>
    nnoremap <F1> <ESC>
    vnoremap <F1> <ESC>

    " When vimrc is edited, reload it
    "autocmd! bufwritepost vimrc source ~/.vim/vimrc
" }

" Fonts & Theme {
    " Font {
        " Choose font for linux, mac and windows.
        if has("gui_gtk2")
            set guifont=Consolas\ 10
        elseif has("gui_win32")
            set guifont=Consolas:h10
        end
    " }

    " Theme {
        set t_Co=256

        " Solarized {
            " General options
            let g:solarized_termcolors=256      " 16|256 terminal colors
            let g:solarized_termtrans=0         " 0|1 terminal transparency
            let g:solarized_degrade=0           " 0|1 for testing
            let g:solarized_bold=1              " 0|1 stop solarized from displaying bold
            let g:solarized_underline=1         " 0|1 stop solarized from displaying underline
            let g:solarized_italic=1            " 0|1 stop solarized from displaying italic
            let g:solarized_contrast="high"     " low|normal|high set contrast
            let g:solarized_visibility="low"    " low|normal|high set visibility

            " Choose theme
            colorscheme solarized               " load colorscheme

            " Choose background for gvim and vim.
            if has('gui_running')
                set background=light
            else
                set background=dark
            endif
        " }
    " }
" }

" Scrolling and Folding {
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code

    """ Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
" }

" Line Numbers {
    set number                  " Line numbers on
    set relativenumber          " Relative line numbers on

    " Use relative numbers only focus is on the vim window.
    autocmd FocusLost * :set number
    autocmd FocusGained * :set relativenumber

    " Use relative numbers only when in normal mode
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber

" }

" Windows and Buffers {
    set hidden                  " allow buffer switching without saving
    set winminheight=0         " windows can be 2 line high
    set splitbelow              " When splitting put new window below of the current one
    set splitright              " When splitting put new window to the right of the current one
    au VimResized * :wincmd =   " Resize splits when the windows is resized.
    au FocusLost * : silent! wall " Save when losing focus

    " Redraw screen
    nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

    " Moving around {
        " Easier moving in tabs and windows
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_

        map <Leader>= <C-w>=        " Adjust viewports to the same size
    " }
" }

" Whitespace {
    " Highlight problematic whitespace with the following symbols,
    " but only show trailing whitespace when not in insert mode.
    set list
    set listchars=tab:▸\
    set listchars+=extends:❯
    set listchars+=precedes:❮
    "set listchars+=eol:¬
    augroup trailing
        au!
        au InsertEnter * :set listchars-=trail:⌴
        au InsertLeave * :set listchars+=trail:⌴
    augroup END

    " Remove trailing whitespaces when saving
    autocmd BufWritePre * :%s/\s\+$//e
    "autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :%s/\s\+$//e

    " Insert empty line above or below while staying in normal mode
    nnoremap <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>
    nnoremap <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>

" }

" Languages & Spellchecking {
    " Greek {
        " Use Greek letters in command mode
        :set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz
    " }

    set dictionary=/usr/share/dict/words
    set spellfile=~/.vim/custom-dictionary.utf-8.add

    if version >= 700
        set spell spelllang=en
    endif
" }

" Syntax Highlighting {
    set synmaxcol=500           " Don't try to highlight lines longer than 120 chars.
    autocmd BufRead,BufNewFile *.conf setf dosini
" }

" TimeOuts {
    " Time out on key codes but not mappings.
    " Basically this makes terminal Vim work sanely.
    set notimeout
    set ttimeout
    set ttimeoutlen=10
" }

" Moving around {
    " When moving stay in the middle of the window.
    nnoremap g; g;zz
    nnoremap g, g,zz
    nnoremap <c-o> <c-o>zz

    " It's 2012.
    noremap j gj
    noremap k gk
    noremap gj j
    noremap gk k

" }

" highlight and searching {
    set incsearch                   " incremental search
    set hlsearch                    " highlight search terms
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present

    " use sane regexes.
    "nnoremap / /\v
    "vnoremap / /\v

    " matching pairs
    set showmatch                   " show matching symbols (parens etc)
    set matchtime=3                 " time to show matching paren
    set matchpairs+=(:)
    set matchpairs+=[:]
    set matchpairs+={:}
    set matchpairs+=<:>

    " clear highlighted search
    nmap <silent> <leader>/ :nohlsearch<cr>

    " keep search matches in the middle of the window.
    nnoremap n nzzzv
    nnoremap n nzzzv
" }

" Tabs, spaces, wrapping {
    set tabstop=8                   " an indentation every eight columns
    set shiftwidth=4                " use indents of 4 spaces
    set shiftround                  " Always round to multiple of 'shiftwidth'
    set softtabstop=4               " let backspace delete indent
    set expandtab                   " tabs are spaces, not tabs
    set formatoptions=qrn1
    set colorcolumn=100
    set autoindent                  " indent at the same level of the previous line

    " Use two spaces in html files
    autocmd FileType html,jinja,django :setlocal sw=2 ts=2 sts=2  " Two spaces for HTML files
    autocmd FileType make :setlocal noexpandtab      " Do not expand tabs for makefiles


    " Wrap {
        set nowrap                      " Wrap long lines (or not!)
        set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
        set textwidth=100
        " Wrapped lines goes down/up to next row, rather than next line in file.
        nnoremap j gj
        nnoremap k gk

        " Formatting, TextMate-style
        nnoremap Q gqip
        vnoremap Q gq

        " Keep the cursor in place while joining lines
        nnoremap J mzJ`z

        "Split line (sister of [J]oin lines)
        " The normal use of S is covered by cc, so don't worry about shadowing
        nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
    " }
" }

" Backup - Undo - Swap{
    " Undo {
        set undodir=~/.vim/tmp/undo//     " undo files
        if has('persistent_undo')
            set undofile                "so is persistent undo ...
            set undolevels=1000         "maximum number of changes that can be undone
            set undoreload=10000        "maximum number lines to save for undo on a buffer reload
        endif
    " }

    " Backup {
        set backupdir=~/.vim/tmp/backup// " backups
        set backup                        " enable backups
    " }

    " Swap {
        set directory=~/.vim/tmp/swap//   " swap files
        set noswapfile                    " It's 2012, Vim.
    " }
" }

" Completion {
    " WildMenu Completion {
        set wildmenu                    " show list instead of just completing
        set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.

        set wildignore+=.hg,.git,.svn                    " Version control
        set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
        set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
        set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
        set wildignore+=*.spl                            " compiled spelling word lists
        set wildignore+=*.sw?                            " Vim swap files
        set wildignore+=migrations                       " Django migrations
        set wildignore+=*.pyc,*.pyo                      " Python byte code
        set wildignore+=*.orig                           " Merge resolution files
    " }
" }

" Misc {
    " Clipboard {
        noremap <leader>y "*y
        noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
        noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
        vnoremap <leader>y "*ygv

        " Yank from the cursor to the end of the line, to be consistent with C and D.
        nnoremap Y y$
    " }

    " CursorLine {
        " Only show cursorline in the current window and in normal mode.
        augroup cline
            au!
            au WinLeave * set nocursorline
            au WinEnter * set cursorline
            au InsertEnter * set nocursorline
            au InsertLeave * set cursorline
        augroup END
    " }

    " Make Vim able to edit crontab files again.
    set backupskip=/tmp/*,/private/tmp/*"

    " Make sure Vim returns to the same line when you reopen a file.
    augroup line_return
        au!
        au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute 'normal! g`"zvzz' |
            \ endif
    augroup END

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Stupid shift key fixes
    "cmap W w
    "cmap WQ wq
    "cmap wQ wq

    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h

    " Some helpers to edit mode : http://vimcasts.org/e/14
    " %% : Expands directory of the current file to the command line
    cnoremap %% <C-R>=expand('%:h').'/'<cr>

    " The following commands open a file in the same directory as the currently
    " edited file.
    " 'w' opens it in a new window.
    " 's' opens it in a new split.
    " 'v' opens it in a new vertical split.
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
" }

 " Functions {

    function! InitializeDirectories()
        let separator = "."
        let parent = $HOME
        let prefix = '.vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = parent . '/' . prefix . dirname . "/"
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction

call InitializeDirectories()

    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
" }

" LaTeX {
    let g:Tex_DefaultTargetFormat='pdf'
    let g:Tex_ViewRule_pdf='evince'
    let g:Tex_CompileRule_pdf = 'xelatex -interaction=nonstopmode $*'
" }
