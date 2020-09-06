syntax on
set number
set mouse=a
set splitright
set tags=tags
set cursorline
set backspace=indent,eol,start
set autoindent
set smartindent
set showmatch
set noshowmode
set tabstop=5
set shiftwidth=4
set fillchars+=vert:\▐

filetype plugin indent on

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
au BufEnter *.py :RainbowParentheses<CR>

let g:python3_host_prog='/Users/tanguy/.miniconda3/bin/python'

" ----------------------------------------------------------------------------
"  						   COLORSCHEME
"----------------------------------------------------------------------------
let &t_ZH="\e[4m"
let &t_ZR="\e[33m"
colorscheme wal
augroup python_syntax_extra
  autocmd!
  autocmd! Syntax python :syn keyword Keyword self
augroup END

hi Visual cterm=none ctermbg=white ctermfg=black 

highlight NonText cterm=none ctermfg=8 ctermbg=none

highlight clear CursorLine
hi CursorLineNR ctermbg=black ctermfg=7

hi StatusLine cterm=none ctermbg=black ctermfg=none 
hi StatusLineNC cterm=none ctermbg=none ctermfg=none

hi GitGutterAddLineNr ctermfg=black ctermbg=2 cterm=bold
hi GitGutterChangeLineNr ctermfg=black ctermbg=grey cterm=bold
hi GitGutterDeleteLineNr ctermfg=black ctermbg=grey cterm=standout
hi GitGutterChangeDeleteLineNr ctermfg=black ctermbg=grey cterm=standout

hi Pmenu ctermbg=black ctermfg=white

hi MatchParen cterm=none ctermbg=white ctermfg=black

" ----------------------------------------------------------------------------
"  						    SHORTCUTS
" ----------------------------------------------------------------------------
" Change panel shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap ++ :vsp<CR>
nnoremap Q q
nnoremap q <Nop>
nmap mm :w<CR>
nmap qq :wq<CR>
nmap <C-O> :bn<CR>
nmap <C-I> :bp<CR>
nmap <C-P> :bd<CR>
nmap <C-F> :Lines<CR>
nmap <C-D> :Files<CR>
nmap <C-S> :Buffers<CR>
nnoremap <A-J> <C-E>
nnoremap <A-K> <C-Y>

" Change scroll shortcuts
map <Down> <C-E>
map <Up> <C-Y>

" Add easy nbreakpoint shortcut
nnoremap <silent> <C-B> :let a='import pdb; pdb.set_trace()'\|put=a<CR>

" Add easy jump to definition
nmap gd :call CocAction('jumpDefinition', 'drop')<CR>

" ----------------------------------------------------------------------------
"  						      CURSOR
" ----------------------------------------------------------------------------
" Set cursor variable
set guicursor+=v-i:ver30-blinkon200-blinkoff150
set guicursor+=n:block-blinkon200-blinkoff150

" ----------------------------------------------------------------------------
"  						   VIM WORKSPACE
"----------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim
    \ --create-dirs https://raw.githubusercontent.com/
    \ junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" ----------------------------------------------------------------------------
"  						     GIT-GUTTER 
"----------------------------------------------------------------------------
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
"          					 RANGER
" ----------------------------------------------------------------------------
map <C-r> :Ranger<CR>

" ----------------------------------------------------------------------------
"          					   COC
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

" ----------------------------------------------------------------------------
"  						     VIM PLUG	
"----------------------------------------------------------------------------
call plug#begin()

Plug 'bluz71/vim-moonfly-statusline'
Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'MathSquared/vim-python-sql'
Plug 'ludovicchabant/vim-gutentags'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'thaerkh/vim-workspace'
Plug 'arcticicestudio/nord-vim'

call plug#end()
