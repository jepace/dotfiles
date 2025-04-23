" .vimrc — @jepace
" Cross-platform, portable, annotated Vim config

" === Core Vim Settings ===
set nocompatible              " Use Vim defaults, not Vi
set encoding=utf-8            " UTF-8 encoding
filetype plugin indent on     " Enable filetype-based plugins and indenting
syntax enable                 " Turn on syntax highlighting

" === Clipboard and Undo ===
if has("clipboard")
  set clipboard=unnamedplus   " Use system clipboard (if available)
endif
set undofile                  " Persistent undo
set undodir=~/.vim/undo       " Where to store undo files
set noswapfile                " Don't write .swp files

" === Display and UI ===
set number relativenumber     " Show line numbers and relative numbers
set showcmd                   " Show command in bottom bar
set signcolumn=yes            " Keep signcolumn visible
set colorcolumn=80            " Highlight column 80
set cursorline                " Highlight the current line
set termguicolors             " Enable truecolor support (for nice themes)
set mouse=a                   " Enable mouse support

" === Tabs, Indents, Wrapping ===
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab " 4-space tabs
set smartindent autoindent                       " Auto-indent nicely
set whichwrap+=<,>,h,l                           " Move past line boundaries

" === Scrolling and Windows ===
set scrolloff=8 sidescrolloff=5 " Keep cursor centered vertically/horizontally
set splitbelow splitright      " Open new splits below/right

" === Searching ===
set hlsearch incsearch         " Highlight and live update
set ignorecase smartcase       " Case-insensitive unless caps used

" === Performance ===
set updatetime=300             " Reduce CursorHold delay
set timeoutlen=500             " Faster escape
set hidden                     " Allow background buffers

" === Wildmenu (command-line completion) ===
set wildmenu
set wildmode=longest:full,full
set shortmess+=c

" === Bootstrapping vim-plug ===
let s:plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(s:plug_path)
  echo "Installing vim-plug..."
  silent execute '!curl -fLo ' . shellescape(s:plug_path) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" === Load plugins only if vim-plug is installed ===
if filereadable(s:plug_path)
  call plug#begin('~/.vim/plugged')
endif

" === Plugins ===
" Interface
Plug 'vim-airline/vim-airline'              " Lean status/tabline
Plug 'vim-airline/vim-airline-themes'       " Themes for airline
" Plug 'arcticicestudio/nord-vim'             " Nord colorscheme (cool tones)
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'                   " Fancy start screen with MRU

" Files and Navigation
Plug 'preservim/nerdtree'                   " File browser panel
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder binary
Plug 'junegunn/fzf.vim'                     " Vim integration for FZF

" Coding
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Full-featured Go dev
Plug 'Yggdroot/indentLine'                  " Visual guide for indentation

" LSP & IntelliSense
if has('nvim') || v:version >= 900
    if executable('node')
        Plug 'neoclide/coc.nvim', {'branch': 'release'} 
    else
        Plug 'prabirshrestha/asynccomplete.vim'
        Plug 'prabirshrestha/vim-lsp'
    endif
endif

Plug 'wellle/tmux-complete.vim'             " Autocompletion across tmux panes

" Text Handling
Plug 'machakann/vim-highlightedyank'        " Highlight yanked text briefly
Plug 'rhysd/open-pdf.vim'                   " View PDFs (for LaTeX etc)
Plug 'dbeniamine/cheat.sh-vim'              " Query cheat.sh from Vim
Plug 'vimwiki/vimwiki'                      " Personal wiki and note-taking
Plug 'farseer90718/vim-taskwarrior'         " Integrate Taskwarrior

" Tmux Navigation
Plug 'christoomey/vim-tmux-navigator'       " Seamless movement between tmux/vim

call plug#end()

" === Mappings ===
let mapleader=","                         " Leader key

" General keybinds
nnoremap <leader>w :w<CR>                  " Save
nnoremap <leader>q :q<CR>                  " Quit
nnoremap <leader>e :NERDTreeToggle<CR>     " Toggle NERDTree
nnoremap <leader>s :source $MYVIMRC<CR>    " Reload config

" Movement enhancements
nnoremap Y y$                              " Yank to end of line
nnoremap n nzzzv                           " Keep search match centered
nnoremap N Nzzzv
nnoremap J mzJ`z                           " Join lines without losing place

" Better insert-mode undo chunks
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Move selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" FZF keybinds
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-t> :Tags<CR>

" Tmux ESC handling (for Neovim)
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" === Plugin Configs ===
set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

let g:NERDTreeShowHidden=1
autocmd VimEnter * if argc() == 0 | NERDTree | endif

let g:vimwiki_list = [{'path': '~/PaceHouse/vimwiki/',
                      \ 'path_html': '~/public_html/wiki/',
                      \ 'auto_export': 1 }]

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-pyright']

" === Yank highlighting ===
if has('nvim')
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
else
  autocmd TextYankPost * silent! call matchadd('IncSearch', '\%'.line("'<").'l\_.*\%'.line("'>").'l')
endif

" === Filetype-specific ===
autocmd FileType gitcommit setlocal spell textwidth=72
autocmd FileType markdown setlocal spell textwidth=80

" === Compatibility safety nets ===
if !has("clipboard")
  set clipboard=
endif

" === Extra: Safe for WSL, BSDs, containers ===
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif

" === Final Touches ===
set backspace=indent,eol,start             " Make backspace behave sanely
set formatoptions+=j                       " Remove comment leader when joining lines
set matchpairs+=<:>                        " Add angle brackets for % match

