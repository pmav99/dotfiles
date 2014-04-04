" Modeline and notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" System specific configuration {
    " Define system {
        fun! MySys()
            return "windows"    "Can be: linux, mac, windows
        endfun
    " }

    " Define location of the configuration folder {
        let $CONFIGURATION_FOLDER="D:\dotfiles"
    " }

" }

" Do NOT change the following lines {
    set rtp+=$CONFIGURATION_FOLDER/vim
    source $CONFIGURATION_FOLDER/vim/vimrc.vim
" }
