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

let g:python3_host_prog='/usr/local/bin/python3'
let g:black_linelength=80

" ----------------------------------------------------------------------------
"  						         VIM PLUG	
" ----------------------------------------------------------------------------
call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'svermeulen/vim-subversive'
Plug 'mhinz/vim-grepper' 
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
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
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
nmap <silent> <C-F> :Lines<CR>
nmap <silent> <C-O> :Files<CR>
nmap <C-S> :Black<CR>
nmap <silent> s :HopChar2<CR>
nmap <silent> S :HopWord<CR>

nmap gs <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)
" nmap S <plug>(SubversiveSubstituteToEndOfLine)



" Add easy nbreakpoint shortcut
nnoremap <silent> <C-B> :let a='import pdb; pdb.set_trace()'\|put=a<CR>
nnoremap <silent> -- :let a='# --------------------------------------------
    \---------------------------------'\|put=a<CR>

" -----------------------------------------------------------------------------
"  						             Treesitter
" -----------------------------------------------------------------------------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
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
  }
}
EOF


" ---------------------------------------------------------------------------
"  						        Treesitter
"----------------------------------------------------------------------------
lua <<EOF
require "nvim-treesitter"
require'nvim-treesitter.configs'.setup {
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
" -------------------------------------------------------------
"  Grepper
"  ------------------------------------------------------------
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
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', ".vim", "app.env"]

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

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
nmap <silent> gd :call <SID>GoToDefinition()<CR>

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

" --------------------------------------------------------------
" startify
" --------------------------------------------------------------
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
          " \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]
let g:startify_files_number = 2
let g:webdevicons_enable_startify = 1
" let g:startify_session_autoload = 1
let g:startify_change_to_dir = 0
" let g:workspace_session_directory = $HOME . '/.cache/sessions/'
let g:startify_session_autoload = 1
let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'

let g:startify_custom_header = [
        \ '                         ▄              ▄                  ',
        \ '                        ▌▒█           ▄▀▒▌                 ',
        \ '                        ▌▒▒▀        ▄▀▒▒▒▐                 ',
        \ '                       ▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐                 ',
        \ '                     ▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐                 ',
        \ '                   ▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀██▀▒▌                 ',
        \ '                  ▐▒▒▒▄▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▒▌                ',
        \ '                  ▌▒▒▐▄█▀▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐                ',
        \ '                 ▐▒▒▒▒▒▒▒▒▒▒▒▌██▀▒▒▒▒▒▒▒▒▀▄▌               ',
        \ '                 ▌▒▀▄██▄▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌               ',
        \ '                 ▌▀▐▄█▄█▌▄▒▀▒▒▒▒▒▒░░░░░░▒▒▒▐               ',
        \ '                ▐▒▀▐▀▐▀▒▒▄▄▒▄▒▒▒▒▒░░░░░░▒▒▒▒▌              ',
        \ '                ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒░░░░░░▒▒▒▐               ',
        \ '                 ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌               ',
        \ '                 ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐                ',
        \ '                  ▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▌                ',
        \ '                    ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀                 ',
        \ '                   ▐▀▒▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀                   ',
        \ '                  ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▀                      ',
        \ ]

" -------------- make nerdtree work at startup ------------------------------ "
" autocmd VimEnter *
"                 \   if !argc()
"                 \ |   Startify
"                 \ |   NERDTree
"                 \ |   wincmd w
"                 \ | endif

" --------------------------------------------------------------
" quickrun
" --------------------------------------------------------------
" outputte /message/log = the output don't capture logging
            " \ 'runner':'terminal',
            " \ 'runner/terminal/into':1,
            " \ 'outputter/buffer/close_on_empty' : 1,
            " \ 'outputter/loclist/into':1

            " \ 'runner': 'vimproc',
            " \ 'runner':'terminal',
            " \ 'runner/terminal/into':1,
let b:quickrun_config = {
            \ 'outputter':'error',
            \ 'outputter/error/success':'buffer',
            \ 'outputter/error/error':'loclist',
            \  }

"             \ 'outputter/loclist/errorformat':'&errorformat',
            " \ 'outputter/buffer/close_on_empty' : 1,

            " \ "hook/close_unite_quickfix/enable_hook_loaded" : 1,
            " \ "hook/unite_quickfix/enable_failure" : 1,
            " \ "hook/close_quickfix/enable_exit" : 1,
            " \ "hook/close_buffer/enable_failure" : 1,
            " \ "hook/close_buffer/enable_empty_data" : 1,
            " \ "outputter/buffer/split" : ":botright 8sp",
            " \ "outputter" : "multi:buffer:quickfix",
            " \	"outputter/buffer/append":0,
            " \	"outputter":"buffered",
            " \	"outputter/buffered/target":"buffer",
            " \	"outputter/buffer/split":"Uniqtab",
            " \	"runner/vimproc/updatetime":0,
            " \ 'outputter/buffer/close_on_empty' : 1,
            " \ 'outputter/message/log':0,
            " \ 'runner/terminal/into':1,
            " \ 'outputter/loclist/into':1
            " \ 'outputter': 'quickfix'
            " \ 'outputter/quickfix/into':1
" 'tex': {
"         \    'command': 'platex',
"         \    'exec': ['%c -output-directory %s:h %s', 'dvipdfmx -o %s:r.pdf %s:r.dvi', 'open %s:r.pdf']
"         \   },
" let g:quickrun_config['sql'] = {
" 		\ 'command': 'psql',
" 		\ 'exec': ['%c %o < %s'],
" 		\ 'cmdopt': '%{MakepgsqlCommandOptions()}',
" 		\ }

" let g:quickrun_config['R'] = {'command': 'R', 'exec': ['%c -s --no-save -f %s', ':%s/.\b//g']}
" stop quickrun with <Ctrl-c>
nnoremap <expr><silent> <C-h> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-h>"

" --------------------------------------------------------------
" unstack
" --------------------------------------------------------------
nnoremap <C-u> :UnstackFromClipboard<CR>
nnoremap <space>j :copen<CR><C-w>JG<CR>
