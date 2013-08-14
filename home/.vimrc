source ~/.vim/bundles.vim

set nocompatible
set encoding=utf-8

" enable syntax highlighting and file type detection
syntax enable
filetype plugin indent on

" display the mode
set showmode

" enable backspace over auto-indention and line breaks
set backspace=indent,eol,start

" enable abandoned buffers to be hidden vs unloaded
set hidden

" enable command line completion
set wildmenu
set wildmode=list:longest

" enable search highlighting and smartcase matching
set incsearch
set hlsearch
set ignorecase
set smartcase

" enable line numbers
set number

" configure status line
set laststatus=2
set statusline=%f\ %y%m%{fugitive#statusline()}%=%l,%c%V

" show unwanted whitespace (tabs and trailing spaces)
set list listchars=tab:»·,trail:·

" enable line wrapping breaking at word boundaries
set wrap
set linebreak

" enable 5 lines of context around the cursor
set scrolloff=5

" disable backups and swap files
set nobackup
set noswapfile

" enable tab to space replacement
set expandtab
set shiftwidth=2
set softtabstop=2

" set default color scheme
set background=dark
colorscheme eighties

" set defaults for folding
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set foldlevel=1

" set clipboard to use unnamed register
set clipboard=unnamed

" set file type specifics (move to ftplugin)
autocmd FileType tmux setlocal commentstring=#\ %s

" setup tailored key mappings
let mapleader = ','
nnoremap <CR> :noh<CR><CR>
inoremap jk <ESC>
noremap <leader>s ?{<CR>jV/^\s*\}\=$<CR>k:sort<CR>:let @/=''<CR>

nnoremap <leader>- :t.<CR>:s/./-/g<CR>:noh<CR><CR>
nnoremap <leader>= :t.<CR>:s/./=/g<CR>:noh<CR><CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
