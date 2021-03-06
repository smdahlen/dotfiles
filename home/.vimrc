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

" set whitespace characters (tabs and trailing spaces)
set nolist listchars=tab:»\ ,trail:·

" enable line wrapping breaking at word boundaries
set wrap
set linebreak

" enable 5 lines of context around the cursor
set scrolloff=5

" disable backups and swap files
set nobackup
set noswapfile

set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

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
autocmd BufReadPost fugitive://* set bufhidden=delete

" setup tailored key mappings
let mapleader = ','
nnoremap <CR> :noh<CR><CR>
inoremap jk <ESC>
noremap <leader>s ?{<CR>jV/^\s*\}\=$<CR>k:sort<CR>:let @/=''<CR>

nnoremap <leader>- :t.<CR>:s/./-/g<CR>:noh<CR><CR>
nnoremap <leader>= :t.<CR>:s/./=/g<CR>:noh<CR><CR>
nnoremap <leader>d "=strftime("%m/%d/%Y")<CR>p

nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>bc :Bclose<CR>
nnoremap <leader>w :write<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

inoremap <leader>u <esc>gUiwea
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

" define settings for emmet
let g:user_emmet_settings = {'html': {'empty_element_suffix': '>'}}

" ignore npm and bower directories for ctrlp
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/](node_modules|bower_components|www|coverage)$'
			\ }

" hide statusline in ctrlp buffer
let g:ctrlp_buffer_func = {
			\ 'enter': 'HideStatusLine',
			\ 'exit':  'ShowStatusLine',
			\ }

func! HideStatusLine()
	set laststatus=0
endfunc

func! ShowStatusLine()
	set laststatus=2
endfunc

let g:syntastic_html_checkers=['']
