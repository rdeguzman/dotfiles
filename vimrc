" based on http://github.com/jferris/config_files/blob/master/vimrc
set t_Co=256

"AutoLoad VIM
autocmd! bufwritepost .vimrc source %

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Mouse Settings and backspacing over everything in insert mode
set mouse=a
set backspace=2

" Allows to copy and paste from vim to another application
set clipboard=unnamed

set nobackup
set nowritebackup
set noswapfile

set history=50 "keep 50 lines of command line history
set ruler      " show the cursor position all the time
set showcmd    " display incomplete commands
set incsearch  " do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Switch wrap off for everything
set nowrap

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Numbers
set number
set numberwidth=5

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" case only matters with mixed case expressions
set ignorecase
set smartcase

" \ is the leader character
let mapleader = ","

" Quicksave
noremap <Leader>w :update<CR>
noremap <Leader>q :q!<CR>
noremap <Leader>Q :qa!<CR>

" Tabs
noremap <Leader>t :tabnew<CR>
noremap <Leader>n <esc>:tabprevious<CR>
noremap <Leader>m <esc>:tabnext<CR>

" Files and Search
noremap <Leader>f :Files<CR>
noremap <Leader>a :Ag<CR>

" Remap Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Indents
vnoremap < <gv
vnoremap > >gv

" Open splits more natural below and right
set splitbelow
set splitright

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'skwp/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

"vim-airline
:let g:airline_theme='solarized'

if has("gui_running")
  :set guifont=Monaco:h18
  colorscheme solarized
endif
