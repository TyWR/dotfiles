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
colorscheme default

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

let g:python3_host_prog='/usr/local/bin/python3'
let g:black_linelength=80

" ----------------------------------------------------------------------------
"  						         VIM PLUG	
" ----------------------------------------------------------------------------
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'MathSquared/vim-python-sql'
Plug 'ludovicchabant/vim-gutentags'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'thaerkh/vim-workspace'
Plug 'mattn/vim-findroot'
Plug 'tywr/minimalist-status-line'
Plug 'kkoomen/vim-doge', { 'tag': 'v2.8.0' }
Plug 'psliwka/vim-smoothie'
Plug 'airblade/vim-rooter'
Plug 'dahu/vim-fanfingtastic'
Plug 'RRethy/vim-illuminate' 
Plug 'ap/vim-buftabline'
Plug 'phaazon/hop.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

lua require 'hop'.setup()

" ---------------------------------------------------------------------------
"  						        COLOR SCHEME
"----------------------------------------------------------------------------
set t_u7=
set t_RV=
let &t_ZH="\e[4m"
let &t_ZR="\e[33m"

colorscheme wal

augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword PythonSelf self
                \ | highlight def link PythonSelf Special
augroup end

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

hi TabLineSel cterm=bold ctermbg=2 ctermfg=15
hi TabLine cterm=bold ctermbg=15 ctermfg=8
hi TabLineFill cterm=bold ctermbg=15 ctermfg=2
hi PmenuSel cterm=bold ctermbg=15 ctermfg=8

hi CocFloating cterm=bold ctermbg=15 ctermfg=7
hi CocErrorFloat cterm=bold ctermbg=15 ctermfg=1
hi CocWarningFloat cterm=bold ctermbg=15 ctermfg=1
hi CocInfoFloat cterm=bold ctermbg=15 ctermfg=7
hi CocHintFloat cterm=bold ctermbg=15 ctermfg=7
hi CocHighlightText cterm=bold ctermbg=2 ctermfg=2

hi BufTabLineActive cterm=bold ctermbg=15 ctermfg=7

hi HopNextKey cterm=bold ctermfg=1
hi HopNextKey1 cterm=bold ctermfg=4
hi HopNextKey2 cterm=bold ctermfg=7

hi TSFunction cterm=bold ctermbg=None ctermfg=2

autocmd FileType markdown highlight htmlH1 cterm=bold ctermfg=1
autocmd FileType markdown highlight htmlH2 cterm=bold ctermfg=2
autocmd FileType markdown highlight htmlH3 cterm=bold ctermfg=3
autocmd FileType markdown highlight htmlH4 cterm=bold ctermfg=4
autocmd FileType markdown highlight htmlH5 cterm=bold ctermfg=5

" ----------------------------------------------------------------------------
"  						          SHORTCUTS
" ----------------------------------------------------------------------------
"  Remove sexy scrolls mappings
" let g:smoothie_no_default_mappings=True

" Change panel shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vmap Y "+y

nmap <Down> :call  smoothie#downwards()<CR>
nmap <Up> :call  smoothie#upwards()<CR>

nmap ++ :vsp<CR>
nmap °° :sp<CR>
nnoremap M q
nnoremap à @a
nnoremap q <Nop>
nnoremap Q <Nop>
nmap mm :w<CR>
nmap qq :wq<CR>
nmap QQ :bd<CR>
nmap U :redo<CR>
nmap <S-Tab> :bp<CR>
nmap <Tab> :bn<CR>
nmap <C-F> :Lines<CR>
nmap <C-O> :Files<CR>
nmap <C-P> :Buffers<CR>
nmap <C-S> :Black<CR>
nmap <C-A> :EnableAutocorrect<CR>

lua vim.api.nvim_set_keymap('n', 'S', "<cmd>lua require'hop'.hint_words()<cr>", {})
lua vim.api.nvim_set_keymap('n', 's', "<cmd>lua require'hop'.hint_char2()<cr>", {})

" Add easy nbreakpoint shortcut
nnoremap <silent> <C-B> :let a='import pdb; pdb.set_trace()'\|put=a<CR>
nnoremap <silent> -- :let a='# --------------------------------------------
    \---------------------------------'\|put=a<CR>

" Add easy jump to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nnoremap <silent> K :call <SID>show_documentation()<CR>


" -----------------------------------------------------------------------------
"  						             Treesitter
" -----------------------------------------------------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true ,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  }
}

require("nvim-treesitter.configs").setup {
  highlight = {
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
EOF

" -----------------------------------------------------------------------------
"  						             RANGER
" -----------------------------------------------------------------------------
let g:ranger_replace_netrw = 1
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

"-----------------------------------------------------------------------------
"  						             GTAGS
" -----------------------------------------------------------------------------
" config project root markers.
let g:gutentags_project_root = ['.root']
" generate databases in my cache directory, prevent gtags files polluting
" my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor",
                                 \ ".git", "node_modules", "*.vim/bundle/*"]

" ----------------------------------------------------------------------------
"  						             CURSOR
" ----------------------------------------------------------------------------
" Set cursor variable
set guicursor+=v-i:ver30-blinkon200-blinkoff150
set guicursor+=n:block-blinkon200-blinkoff150

" ----------------------------------------------------------------------------
"  						          VIM WORKSPACE
" ----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim
    \ --create-dirs https://raw.githubusercontent.com/
    \ junegunn/vim-plug/master/plug.vim'
" Change scroll shortcuts
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" ----------------------------------------------------------------------------
"  						          GIT-GUTTER 
" ----------------------------------------------------------------------------
let g:gitgutter_signs = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

" ---------------------------------------------------------------------------
"  						         FZF
" ---------------------------------------------------------------------------
let $FZF_DEFAULT_OPTS='
    \ --color=dark --color=fg:7,bg:-1,hl:-1,bg+:-1,hl+:1
    \ --color=info:5,prompt:5,pointer:12,marker:1,spinner:1,header:-1
    \ --layout=reverse  --margin=1,4'

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left,
			 \ 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" ----------------------------------------------------------------------------
"          					     RANGER
" ----------------------------------------------------------------------------
map <C-r> :Ranger<CR>

" ----------------------------------------------------------------------------
"          					       COC
" ----------------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ----------------------------------------------------------------------------
"          					       DOGE
" ----------------------------------------------------------------------------
let g:doge_doc_standard_python = 'numpy'
let g:doge_mapping = '<C-d>'
let g:doge_parsers = ['bash', 'python']


" ----------------------------------------------------------------------------
"                                 Utility 
" ----------------------------------------------------------------------------
function! Syn()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction
command! -nargs=0 Syn call Syn()
