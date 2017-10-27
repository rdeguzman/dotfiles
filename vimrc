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

noremap <Leader>n :NERDTree<CR>
"let g:NERDTreeMouseMode = 3 to get single-click behaviour.
let NERDTreeShowHidden=1
let NERDTreeIgnore=['.git$[[dir]]', '.swp']

" Files and Search
noremap <Leader>f :Files<CR>
noremap <Leader>a :Ag<CR>

" Remap Splits
noremap <Leader>\ :vsp<CR>
noremap <Leader>- :sp<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" <C-W> = #Resize splits equally

" Syntastic open Location window and go back
noremap <Leader>e :lopen<CR><C-W><C-K><CR>
noremap <Leader>E :lclose<CR>

" Indents
vnoremap < <gv
vnoremap > >gv

" Enable / Disable mouse and numbers for copy and paste to other applications
noremap <Leader>( :set mouse=""<CR>:set nonu<CR>:GitGutterDisable<CR>
noremap <Leader>) :set mouse=a<CR>:set nu<CR>:GitGutterEnable<CR>

" Enable and siable wrapping
noremap <Leader>8 :set wrap linebreak nolist<CR>
noremap <Leader>* :set nowrap<CR>

" Fold
" To create a fold: visual highlight + zf
noremap <space> za

" Open splits more natural below and right
set splitbelow
set splitright

" Disable paste
set pastetoggle=<F2>

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

function! SplitDebug(command)
  let result = system(a:command)

  "Open a new split and set it up
  vsplit __ShowTest__
  normal! ggdG
  setlocal buftype=nofile

  call append(0, result)
endfunction

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
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'albfan/nerdtree-git-plugin'
Plug 'thoughtbot/vim-rspec'

" Initialize plugin system
call plug#end()

"vim-airline
:let g:airline_theme='solarized'

if has("gui_running")
  :set guifont=Monaco:h18
  colorscheme solarized
endif

" syntastic
"let g:syntastic_shell = "/bin/zsh"
"let g:syntastic_debug = 9
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_exec = "/Users/rupert/.rvm/rubies/ruby-2.3.1/bin/ruby"
let g:syntastic_ruby_mri_exec = "/Users/rupert/.rvm/rubies/ruby-2.3.1/bin/ruby"

"let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_javascript_standard_exec = 'standard'
"let g:syntastic_javascript_standard_generic = 1

map <Leader>t :call RunCurrentSpecFile()<CR>
