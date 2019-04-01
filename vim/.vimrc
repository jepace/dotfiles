" $Id: .vimrc,v 1.6 2017/10/18 22:53:35 jepace Exp $
" Vim Resrouce File
" for James E. Pace

"Vundle
set nocompatible
filetype off

" FIRST: 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

set rtp+=~/.fzf/

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1 

let g:explVertical=1    " split Explorer window vertically
let g:explSplitRight=0  " split to right of explorer
let g:explDirsFirst=0   " Dirs mixed with files in Explorer
let g:explWinSize=20    " Width of Explorer window

syntax on

"let c_comment_strings=1
set hlsearch                " Highlight search results
set mousehide
set number                  " Line numbers
" set relativenumber          " Woah...

set startofline

" spelling check
map #i  :w<CR>:!aspell -c %<CR>:e %<CR>
" map #i  :w<CR>:!ispell %<CR>:e %<CR>

" remove extra white space at end of line; cutting and pasting is
" doing this now
map #w :%s/ *$//

"show match for partly typed search command
set incsearch

" no ^Ms
set ff=unix

set spell           " spell checker!
set noignorecase
" set smartcase
" set smartindent
set cinoptions=t0,(0
set shiftwidth=4
set tabstop=4       " tab stop of 4 characters
set softtabstop=4
" 2019: I now believe in tabs! set expandtab       " write spaces, not tabs
set smarttab
set textwidth=79
set shiftwidth=4
"autocmd FileType c set cindent
"autocmd FileType cpp set cindent
"autocmd FileType php set cindent
"autocmd FileType go set cindent
"autocmd FileType python set cindent
"autocmd FileType perl call Set_perl_mode()

set wildmenu    " show possible matches when tab hit

set title
"set notitle
"set titleold="Remote"
set ruler
set visualbell
set showmode
set writeany
set tw=70           " line width
set showmatch
"set redraw
"set nobackup

" Save and continue editing
imap jj <ESC>:w<CR>a

" My abbreviations
"ab jep /* JEP */
"ab endif #endif
"ab dbg #ifdef DEBUG
"ab w32 if ( $^O eq "MSWin32" )

"function! Set_perl_mode()
"   " Keep perl '#' out where we are, not at 0
"   set cinkeys=0{,0},0),:,!^F,o,O,e
"   set cindent
"endfunction

"A whole new world ... Bundles! (need vundle)
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'vimwiki/vimwiki'

" Vimwiki settings
let g:vimwiki_folding='expr:quick'
let g:vimwiki_list = [{'path' : '~/PaceHouse/vimwiki/', 
                     \ 'path_html' : '~/public_html/wiki/',
                     \ 'auto_export' : 1 }]
