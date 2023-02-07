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
colorscheme default
packadd cfilter

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

let g:python3_host_prog= $HOME . '/.local/venv/nvim/bin/python'
let g:black#settings = {
    \ 'fast': 1,
    \ 'line_length': 80
\}

" -----------------------------------------------------------------------------
"  						         VIM PLUG	
" -----------------------------------------------------------------------------
call plug#begin()
Plug 'svermeulen/vim-subversive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-highlight'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'MathSquared/vim-python-sql'
Plug 'ludovicchabant/vim-gutentags'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' 
Plug 'tpope/vim-surround'
Plug 'mattn/vim-findroot'
Plug 'tywr/minimalist-status-line'
Plug 'kkoomen/vim-doge', { 'tag': 'v2.8.0' }
Plug 'psliwka/vim-smoothie'
Plug 'airblade/vim-rooter'
Plug 'dahu/vim-fanfingtastic'
Plug 'RRethy/vim-illuminate' 
Plug 'ap/vim-buftabline'
Plug 'p00f/nvim-ts-rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

" -----------------------------------------------------------------------------
"  						        COLOR SCHEME
"------------------------------------------------------------------------------
set t_u8=
set t_RV=
let &t_ZH="\e[4m"
let &t_ZR="\e[33m"

colorscheme wal

augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

hi Visual cterm=none ctermbg=7 ctermfg=0 
hi ExtraWhitespace cterm=none ctermbg=grey ctermfg=black
hi MatchParen cterm=none ctermbg=1 ctermfg=black

highlight NonText cterm=none ctermfg=8 ctermbg=none
highlight Comment cterm=italic gui=italic

highlight clear CursorLine
hi CursorLine ctermbg=15
hi CursorLineNR ctermbg=none ctermfg=7 cterm=bold
hi LineNr ctermbg=none ctermfg=8 cterm=none

hi StatusLine cterm=bold ctermbg=15 ctermfg=none
hi StatusLineNC cterm=none ctermbg=15 ctermfg=8

hi GitGutterAddLineNr ctermfg=black ctermbg=2 cterm=bold
hi GitGutterChangeLineNr ctermfg=black ctermbg=grey cterm=bold
hi GitGutterDeleteLineNr ctermfg=black ctermbg=grey cterm=standout
hi GitGutterChangeDeleteLineNr ctermfg=black ctermbg=8 cterm=standout

hi NormalFloat cterm=bold ctermbg=15 ctermfg=7

hi VertSplit ctermbg=15 ctermfg=15
hi ColorColumn ctermfg=none ctermbg=15

hi TabLineSel cterm=bold ctermbg=2 ctermfg=15
hi TabLine cterm=bold ctermbg=15 ctermfg=8
hi TabLineFill cterm=bold ctermbg=15 ctermfg=2

hi CocMenuSel cterm=bold ctermbg=2 ctermfg=15
hi CocFloatThumb cterm=bold ctermbg=2 ctermfg=15
hi CocFloatSBar cterm=bold ctermbg=2 ctermfg=15

hi CocFloating cterm=bold ctermbg=15 ctermfg=7
hi CocErrorFloat cterm=bold ctermbg=15 ctermfg=1
hi CocWarningFloat cterm=bold ctermbg=15 ctermfg=1
hi CocInfoFloat cterm=bold ctermbg=15 ctermfg=7
hi CocHintFloat cterm=bold ctermbg=15 ctermfg=7
hi CocHighlightText cterm=bold ctermbg=2 ctermfg=2

hi PmenuSel cterm=bold ctermbg=2 ctermfg=2

hi BufTabLineActive cterm=bold ctermbg=15 ctermfg=7

hi HopNextKey cterm=bold ctermfg=1
hi HopNextKey1 cterm=bold ctermfg=4
hi HopNextKey2 cterm=bold ctermfg=7

hi TSFunction cterm=bold ctermbg=None ctermfg=2
hi TSMethod cterm=bold ctermbg=None ctermfg=2
hi TSParameter cterm=bold ctermbg=None ctermfg=5
hi TSField cterm=bold ctermbg=None ctermfg=14


hi rainbowcol1 ctermfg=2
hi rainbowcol2 ctermfg=3
hi rainbowcol3 ctermfg=4
hi rainbowcol4 ctermfg=5
hi rainbowcol5 ctermfg=6
hi rainbowcol6 ctermfg=1
hi rainbowcol7 ctermfg=7


autocmd FileType markdown highlight htmlH1 cterm=bold ctermfg=1
autocmd FileType markdown highlight htmlH2 cterm=bold ctermfg=2
autocmd FileType markdown highlight htmlH3 cterm=bold ctermfg=3
autocmd FileType markdown highlight htmlH4 cterm=bold ctermfg=4
autocmd FileType markdown highlight htmlH5 cterm=bold ctermfg=5

" -----------------------------------------------------------------------------
"  						          SHORTCUTS
" -----------------------------------------------------------------------------
"  Remove sexy scrolls mappings
" let g:smoothie_no_default_mappings=True

" Change panel shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-g> :Grepper<CR>

vmap Y "+y

nmap <silent> <Down> :call  smoothie#downwards()<CR>
nmap <silent> <Up> :call  smoothie#upwards()<CR>

nmap <silent> ++ :vsp<CR>
nmap <silent> °° :sp<CR>
nnoremap M q
nnoremap à @a
nnoremap q <Nop>
nnoremap Q <Nop>
nmap <silent> mm :w<CR>
nmap <silent> qq :wq<CR>
nmap QQ :bd<CR>
nmap U :redo<CR>
nmap <silent> <S-Tab> :bp<CR>
nmap <silent> <Tab> :bn<CR>
nmap <silent> <C-F> :Telescope live_grep<CR>
nnoremap <C-O> :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <silent> <c-s> <cmd>:silent !black -q --fast -l 80 %<cr>
inoremap <silent> <c-s> <cmd>:silent !black -q --fast -l 80 %<cr>

nmap gs <plug>(SubversiveSubstitute)

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
nnoremap <silent> gw :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call ShowDocumentation()<CR>

map <C-r> :Ranger<CR>




" Add easy nbreakpoint shortcut
nnoremap <silent> <C-B> :let a='import pdb; pdb.set_trace()'\|put=a<CR>
nnoremap <silent> -- :let a='# --------------------------------------------
    \---------------------------------'\|put=a<CR>

" -----------------------------------------------------------------------------
"  						             Treesitter
" -----------------------------------------------------------------------------
lua <<EOF
require "nvim-treesitter"
require'nvim-treesitter.configs'.setup {
  -- ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["mj"] = "@function.outer",
        ["qj"] = "@conditional.outer",
        ["'j"] = "@loop.outer",
      },
      goto_next_end = {
        ["Mj"] = "@function.outer",
      },
      goto_previous_start = {
        ["mk"] = "@function.outer",
        ["qk"] = "@conditional.outer",
      },
      goto_previous_end = {
        ["Mk"] = "@function.outer",
      },
    },
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ic"] = "@class.inner",
      },
    },
  },
}
EOF

" -----------------------------------------------------------------------------
"  Grepper
"  ----------------------------------------------------------------------------
let g:grepper_quickfix=0             " use location list
let g:grepper_open=1
let g:grepper_switch=1              " Go into the location list after a search
let g:grepper_side=1                " Open a new window and show matches with surrounding contextu
let g:grepper_dir="repo"
let g:grepper_side=1
let g:grepper_tools=['ag']
let g:grepper_highlight=1
nmap gn  <plug>(GrepperOperator)
xmap gn  <plug>(GrepperOperator)

" -----------------------------------------------------------------------------
"  						             RANGER
" -----------------------------------------------------------------------------
let g:ranger_replace_netrw = 1
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

"------------------------------------------------------------------------------
"  						             GTAGS
" -----------------------------------------------------------------------------
" config project root markers.
let g:gutentags_project_root = ['.root']
" generate databases in my cache directory, prevent gtags files polluting
" my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor",
                                 \ ".git", "node_modules", "*.vim/bundle/*"]

" -----------------------------------------------------------------------------
"  						             CURSOR
" -----------------------------------------------------------------------------
" Set cursor variable
set guicursor+=v-i:ver30-blinkon200-blinkoff150
set guicursor+=n:block-blinkon200-blinkoff150

" -----------------------------------------------------------------------------
"  						          VIM WORKSPACE
" -----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim
    \ --create-dirs https://raw.githubusercontent.com/
    \ junegunn/vim-plug/master/plug.vim'
" Change scroll shortcuts
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" -----------------------------------------------------------------------------
"  						          GIT-GUTTER 
" -----------------------------------------------------------------------------
let g:gitgutter_signs = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

" -----------------------------------------------------------------------------
"          					       COC
" -----------------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', ".vim", "app.env"]

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" -----------------------------------------------------------------------------
"          					       DOGE
" -----------------------------------------------------------------------------
let g:doge_doc_standard_python = 'numpy'
let g:doge_mapping = '<C-d>'
let g:doge_parsers = ['bash', 'python']


" -----------------------------------------------------------------------------
"                                 Utility 
" -----------------------------------------------------------------------------
function! Syn()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction
command! -nargs=0 Syn call Syn()
