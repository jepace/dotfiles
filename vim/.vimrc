" $Id: .vimrc,v 1.6 2017/10/18 22:53:35 jepace Exp $
" Vim Resrouce File
" for James E. Pace

set encoding=utf-8

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

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'gruvbox-community/gruvbox'
Plugin 'arcticicestudio/nord-vim'
Plugin 'mhinz/vim-startify'				" Starup menu
Plugin 'preservim/nerdtree'				" Directory tree
Plugin 'machakann/vim-highlightedyank'	" Highlight yanks
Plugin 'rhysd/open-pdf.vim'				" Convert PDFs to text
Plugin 'fatih/vim-go'					" Go tools
"Plugin 'chaoren/vim-wordmotion'			" CamelCase to words
Plugin 'Yggdroot/indentLine'			" Show Indents
Plugin 'dbeniamine/cheat.sh-vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

Plugin 'neoclide/coc.nvim'
let g:coc_disable_startup_warning = 1

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wellle/tmux-complete.vim'
Plugin 'farseer90718/vim-taskwarrior'
"Bundle 'christoomey/vim-tmux-navigator'
"Bundle 'wellle/tmux-complete.vim'
"Bundle 'farseer90718/vim-taskwarrior'

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1 
let g:pdf_convert_on_edit=1
let g:pdf_convert_on_read=1
let g:indentLine_char = ':'

colorscheme nord
"colorscheme gruvbox

" NerdTree on starup
" Blows up startify
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:explVertical=1    " split Explorer window vertically
let g:explSplitRight=0  " split to right of explorer
let g:explDirsFirst=0   " Dirs mixed with files in Explorer
let g:explWinSize=20    " Width of Explorer window

syntax on

"let c_comment_strings=1
set hlsearch                " Highlight search results
set mousehide
set number                  " Line numbers
set relativenumber          " Woah...

set startofline

" spelling check // Use built in set spell now
" map #i  :w<CR>:!aspell -c %<CR>:e %<CR>
" map #i  :w<CR>:!ispell %<CR>:e %<CR>

" remove extra white space at end of line; cutting and pasting is
" doing this now
map #w :%s/ *$//

"show match for partly typed search command
set incsearch

" no ^Ms
set ff=unix

"setlocal spell           " spell checker!
"set noignorecase
set smartcase
" set smartindent
set cindent
" set cinoptions=t0,(0
" set indentexpr
set shiftwidth=4
set tabstop=4       " tab stop of 4 characters
"set softtabstop=4
" 2019: I now believe in tabs! set expandtab       " write spaces, not tabs
set smarttab
set textwidth=79
set shiftwidth=4
set scrolloff=8
"autocmd FileType c set cindent
"autocmd FileType cpp set cindent
"autocmd FileType php set cindent
"autocmd FileType go set cindent
"autocmd FileType python set cindent
"autocmd FileType perl call Set_perl_mode()

set wildmenu    " show possible matches when tab hit

set autowrite	" Autosave
"set title
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

set undofile
set undodir='~/.vim/undo/'

" Copy and paste ... 
" the clipboard line was supposed to be magic, but nope..
" F7 - copy
" Shift F7 - paste
set clipboard+=unnamed
"map <F7> :w!xclip<CR><CR>
vnoremap <C-C> :w !xclip -i -sel c<CR><CR>
"vmap <F7> "*y
" map <S-F7> :r!xclip -o<CR>

"set termguicolors " was promised magic, but it makes things worse..

" Save and continue editing
imap jj <ESC>:w<CR>a

" My abbreviations
"ab jep /* JEP */
"ab endif #endif
"ab dbg #ifdef DEBUG
"ab w32 if ( $^O eq "MSWin32" )

" These are supposed to invoke fzf cleverly.. I don't get it.  Need
" the fzf plugin!
set rtp+=~/usr/src/fzf/

nnoremap ; :Buffers<CR>
nnoremap f :Files<CR>
nnoremap T :Tags<CR>
nnoremap t :BTags<CR>
nnoremap s :Ag<CR>

" Vimwiki settings
" let g:vimwiki_folding='expr:quick'
let g:vimwiki_list = [{'path' : '~/PaceHouse/vimwiki/', 
                     \ 'path_html' : '~/public_html/wiki/',
                     \ 'auto_export' : 1 }]

" tmux complete
let g:tmuxcomplete#trigger = 'completefunc'

" Primeagen
set signcolumn=yes
set colorcolumn=80
set cmdheight=2
set shiftround
"highlight Normal guibg=none
"
" Primeagen
" Y to yank to the end of the line
nnoremap Y y$

" keep the cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" moving lines around
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>k :m .-2<CR>==

