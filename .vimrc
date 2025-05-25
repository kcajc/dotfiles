" Use system clipboard (requires +clipboard Vim build)
set clipboard=unnamedplus

" Show line numbers
set number

" Relative line numbers (helps with movement)
set relativenumber

" Enable mouse support
set mouse=a

" Better search
set ignorecase       " case-insensitive search...
set smartcase        " ...unless uppercase letters used
set incsearch        " show matches as you type
set hlsearch         " highlight search matches

" Use spaces instead of tabs
set expandtab
set tabstop=4        " number of spaces a tab counts for
set shiftwidth=4     " number of spaces for indentation
set softtabstop=4    " how many spaces when you press Tab

" Show matching brackets when cursor is on one
set showmatch

" Enable line wrapping and word wrapping (optional)
set wrap
set linebreak        " wrap at word boundaries

" Set default encoding
set encoding=utf-8

" Show command and mode at the bottom
set showcmd
set showmode

" Enable status line always
set laststatus=2

" Keep some context lines when scrolling
set scrolloff=5
set sidescrolloff=5

" Automatically reload file changed outside Vim
set autoread
autocmd FocusGained,BufEnter * checktime

" Disable swap/backup/undo files in current dir
set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undodir
if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
endif

" Use more natural splits
set splitbelow
set splitright

" Faster key repeat
set timeoutlen=500
set ttimeoutlen=0

" Enable syntax highlighting and filetype plugins
syntax on
filetype plugin indent on

" Map <leader> key (optional but common)
let mapleader = " "

" Quick save
nnoremap <leader>w :w<CR>

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Get into terminal normal mode
tnoremap <Esc> <C-\><C-n>
