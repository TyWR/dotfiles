syntax on
set number
set mouse=a
set splitright
set tags=tags

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=5
" when indenting with '>', use 4 spaces width
set shiftwidth=4


" =============================================================
" /  ___| |              | |           | |      
" \ `--.| |__   ___  _ __| |_ ___ _   _| |_ ___ 
"  `--. \ '_ \ / _ \| '__| __/ __| | | | __/ __|
" /\__/ / | | | (_) | |  | || (__| |_| | |_\__ \
" \____/|_| |_|\___/|_|   \__\___|\__,_|\__|___/
" =============================================================
" Change panel shortcuts
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap ++ :vsp<CR>
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
nnoremap <silent> <C-B> :let a='import pdb; pdb.set_trace()'\|put=a<cr>

" Add easy jump to definition
nmap gd :call CocAction('jumpDefinition', 'drop')<CR>


" =============================================================
" | ___ \ |           (_)          
" | |_/ / |_   _  __ _ _ _ __  ___ 
" |  __/| | | | |/ _` | | '_ \/ __|
" | |   | | |_| | (_| | | | | \__ \
" \_|   |_|\__,_|\__, |_|_| |_|___/
"                 __/ |            
"                |___/
" =============================================================
call plug#begin()

Plug 'neoclide/coc.nvim',
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'MathSquared/vim-python-sql'
Plug 'ludovicchabant/vim-gutentags'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'

call plug#end()

nmap <C-space> :NERDTreeToggle<CR>
set fillchars=vert:█

let g:python3_host_prog='/Users/tanguy/.miniconda3/bin/python'

au BufEnter *.py :RainbowParentheses<CR>

" =============================================================
" |  ___|___  /|  ___|
" | |_     / / | |_   
" |  _|   / /  |  _|  
" | |   ./ /___| |    
" \_|   \_____/\_|
" =============================================================
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:7,bg:-1,hl:-1,bg+:-1,hl+:1 --color=info:5,prompt:5,pointer:12,marker:1,spinner:1,header:-1 --layout=reverse  --margin=1,4'

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

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

" =============================================================
" | \ | |            | | |                
" |  \| | ___ _ __ __| | |_ _ __ ___  ___ 
" | . ` |/ _ \ '__/ _` | __| '__/ _ \/ _ \
" | |\  |  __/ | | (_| | |_| | |  __/  __/
" \_| \_/\___|_|  \__,_|\__|_|  \___|\___|
" =============================================================
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=20
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='>'
let g:NERDTreeDirArrowCollapsible='>'
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "U",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "Unm.",
    \ "Deleted"   : "Χ",
    \ "Dirty"     : "D",
    \ "Clean"     : "C",
    \ 'Ignored'   : "Ι",
    \ "Unknown"   : "?"
    \ }

let NERDTreeStatusline=""
" Git gutter custom signs
let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'


" =============================================================
"   / _ \(_)    | (_)           
"  / /_\ \_ _ __| |_ _ __   ___ 
"  |  _  | | '__| | | '_ \ / _ \
"  | | | | | |  | | | | | |  __/
"  \_| |_/_|_|  |_|_|_| |_|\___|
" =============================================================
let g:airline_powerline_fonts = 1

" Ranger
map <C-r> :Ranger<CR>
map <C-t> :RangerNewTab<CR>

" Colorscheme
let &t_ZH="\e[4m"
let &t_ZR="\e[33m"
colorscheme nord
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
augroup python_syntax_extra
  autocmd!
  autocmd! Syntax python :syn keyword Keyword self
augroup END
highlight Keyword ctermfg=5
highlight Float ctermfg=1
highlight Number ctermfg=1
highlight Error cterm=underline ctermfg=1 gui=undercurl ctermbg=None


" =============================================================
" | ___ \                           
" | |_/ /__ _ _ __   __ _  ___ _ __ 
" |    // _` | '_ \ / _` |/ _ \ '__|
" | |\ \ (_| | | | | (_| |  __/ |   
" \_| \_\__,_|_| |_|\__, |\___|_|   
"                    __/ |          
"                   |___/     
" =============================================================
" Set cursor variable
set guicursor+=v-i:ver30-blinkon200-blinkoff150
set guicursor+=n:block-blinkon200-blinkoff150


" =============================================================
" /  __ \  _  /  __ \            (_)          
" | /  \/ | | | /  \/  _ ____   ___ _ __ ___  
" | |   | | | | |     | '_ \ \ / / | '_ ` _ \ 
" | \__/\ \_/ / \__/\_| | | \ V /| | | | | | |
"  \____/\___/ \____(_)_| |_|\_/ |_|_| |_| |_|
" =============================================================
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
