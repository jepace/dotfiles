" $Id: .vimrc,v 1.6 2017/10/18 22:53:35 jepace Exp $
" Vim Resrouce File
" for James E. Pace

let g:explVertical=1    " split Explorer window vertically
let g:explSplitRight=0  " split to right of explorer
let g:explDirsFirst=0   " Dirs mixed with files in Explorer
let g:explWinSize=20    " Width of Explorer window

syntax on
let c_comment_strings=1
set hlsearch                " Highlight search results
set mousehide
set number                  " Line numbers
set relativenumber          " Woah...

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

set noignorecase
" set smartcase
" set smartindent
set cinoptions=t0,(0
set shiftwidth=4
set tabstop=4       " tab stop of 4 characters
set softtabstop=4
set expandtab       " write spaces, not tabs
set smarttab
set textwidth=79
set shiftwidth=4
"autocmd FileType c set cindent
"utocmd FileType cpp set cindent
"utocmd FileType php set cindent
"utocmd FileType go set cindent
"utocmd FileType python set cindent
"utocmd FileType perl call Set_perl_mode()

set wildmenu    " show possible matches when tab hit

set title
"et notitle
" set titleold="Remote"
set ruler
set visualbell
set showmode
set writeany
set tw=70           " line width
set showmatch
" set redraw
"et nobackup

" My abbreviations
" ab jep /* JEP */
" ab endif #endif
"b dbg #ifdef DEBUG
"b w32 if ( $^O eq "MSWin32" )

"unction! Set_perl_mode()
"   " Keep perl '#' out where we are, not at 0
"   set cinkeys=0{,0},0),:,!^F,o,O,e
"   set cindent
"ndfunction
