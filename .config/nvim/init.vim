syntax on
set relativenumber
set number
set mouse=a
set splitright
set tags=tags
set cursorline
set backspace=indent,eol,start
set showmatch
set noshowmode
set shell=zsh
set background=dark
set nocompatible
set colorcolumn=80
set signcolumn=yes
set noswapfile
packadd cfilter
filetype plugin on

autocmd filetype python setlocal colorcolumn=88
autocmd filetype markdown setlocal conceallevel=2

" Tab settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" Search settings
set incsearch
set hlsearch

filetype plugin indent on

" Leader mapped to space
nnoremap <SPACE> <Nop>
map <Space> <Leader>

" Add custom python endpoint dedicated to neovim experience
let g:python3_host_prog= $HOME . '/.local/venv/nvim/bin/python'
let g:coc_data_home = $HOME . '/.local/share/coc/data'

" Shorter update time
set updatetime=50

lua require('init')
lua require('telescope-conf')
lua require("lsp-conf")
lua require("mappings")
source ~/.config/nvim/vim/colorthemes/orbitals-jupiter.vim

" -----------------------------------------------------------------------------
"  						             CURSOR
" -----------------------------------------------------------------------------
" Set cursor variable
set guicursor+=i:ver50
set guicursor+=v:hor50
set guicursor+=n:block
set guicursor+=r-cr:hor50

" -----------------------------------------------------------------------------
"  						          GIT-GUTTER 
" -----------------------------------------------------------------------------
let g:gitgutter_signs = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
