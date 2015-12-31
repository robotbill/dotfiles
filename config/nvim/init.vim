set encoding=utf-8

set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'vimwiki'
Plug 'kien/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'mileszs/ack.vim'
Plug 'bufexplorer.zip'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'derekwyatt/vim-scala'
Plug 'elzr/vim-json'
Plug 'GEverding/vim-hocon'
Plug 'sukima/xmledit'
Plug 'scrooloose/nerdcommenter'
Plug 'shime/vim-livedown'
Plug 'dag/vim-fish'
Plug 'scrooloose/nerdtree'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

call plug#end()

set noerrorbells
set visualbell
set matchpairs+=<:>
set showmatch    " Show matching brackets when typing
set smartcase
set textwidth=0  " Don't automatically wrap lines
set backspace=2  " Allow backspacing over everything in insert mode
set history=50
set cmdheight=2
set scrolloff=1
set title
set ruler
set showcmd
set hidden
set virtualedit=block
set wrap
set whichwrap=b,s,h,l,<,>,[,]       " No left/right key should have to stop at line breaks

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set indentexpr=           " There was some wacky indenting stuff goin' on
"autocmd FileType perl set smartindent

set list listchars=tab:>-,extends:>,precedes:<,trail:·
set ignorecase
set hlsearch
set complete=.,w,b,u,t
set completeopt=menuone

set number
set statusline=[%n]\ %F\ %(\ %M%R%H)%)\ \@(%l\,%c%V)\ %P
set laststatus=2
set wildmenu
set wildmode=list:longest

"let mapleader=' '

"Remove all autocommand
"au!

"mousing
set mouse=nvi
map <F1> <Esc>:set mouse=<CR>
map <F2> <Esc>:set mouse=nvi<CR>

if has('unix')
    set bk bdir=.,~/.vimbak,/tmp,/var/tmp       " Backup settings
    set     dir=.,~/.vimswp,/tmp,/var/tmp       " Swap file
endif

if has("syntax") && &t_Co > 2 || has("gui_running")
  if has("syntax") && &t_Co >= 256
    set background=light
    colorscheme jml
    let &colorcolumn=join(range(100,100),",")
  endif

  augroup filetype
    au! BufRead,BufNewFile *.t  setlocal filetype=perl
    au! BufRead,BufNewFile *.html setlocal filetype=mason
    au! BufRead,BufNewFile autohandler setlocal filetype=mason
    au! BufRead,BufNewFile *.buf setlocal filetype=sql
    au! BufRead,BufNewFile *.cf setlocal filetype=cf3
    au! BufRead,BufNewFile Capfile setlocal filetype=ruby
    au! BufRead,BufNewFile *.md setlocal filetype=markdown
    au! BufRead,BufNewFile *.json setlocal foldmethod=syntax
    au! BufRead,BufNewFile *.scala setlocal filetype=scala
    au! BufNewFile,BufRead *.mako set filetype=mako
  augroup END
endif

au BufRead,BufNewFile *.wiki setlocal spell
au BufRead,BufNewFile *.md setlocal spell
au BufNewFile,BufRead *txt,*.html,*.tex,README set spell

"scala
au BufRead,BufNewFile *.scala setlocal shiftwidth=2
au BufRead,BufNewFile *.scala setlocal softtabstop=2
au! BufWritePost *.scala Neomake
" automatically reload scala files for scalariform
"au FocusGained,BufEnter *.scala :silent! !
"au BufRead,BufNewFile *.scala setlocal autoread

"haskell
au BufNewFile,BufRead *.hs,*.lhs setlocal tabstop=4
au BufNewFile,BufRead *.hs,*.lhs setlocal softtabstop=4
au BufNewFile,BufRead *.hs,*.lhs setlocal shiftwidth=4

"html and ruby
au BufNewFile,BufRead *.html,*.html.erb setlocal tabstop=2
au BufNewFile,BufRead *.html,*.html.erb setlocal softtabstop=2
au BufNewFile,BufRead *.html,*.html.erb setlocal shiftwidth=2

"mako templating
au BufNewFile,BufRead *.mako setlocal tabstop=2
au BufNewFile,BufRead *.mako setlocal softtabstop=2
au BufNewFile,BufRead *.mako setlocal shiftwidth=2

"TeX LaTeX
au BufNewFile,BufRead *.tex set tw=80

"Google Go
au BufNewFile,BufRead *.go set syntax=go noexpandtab si

"Objective C
autocmd BufNewFile,BufRead *.m vmap ,: :<C-U>AlignCtrl rlp0P0\|<CR>:'<,'>Align :<CR>

"XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"Latex-Suite
let g:Tex_ViewRule_pdf = 'Preview'
let g:tex_flavor='latex'

nmap Y y$
" Yank visually selected block then comment out
vmap ,yc ygv:normal i#<CR>
map ; q:

" Awesome copy and pasting via Bracket
vmap ,x :w !pbcopy<CR><CR>
nmap ,p :r !pbpaste<CR><CR>

" make * work in visual mode
vmap * y:let@/=@"<CR>n

if executable('ag')
" Use ag for Ctrlp for listing files, will respect .gitignore
" Requires ag 'brew install the_silver_searcher'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  "apparently ag is fast enough that we don't need caching
  let g:ctrlp_use_caching = 0

  let g:ackprg='ag --nogroup --nocolor --column'
else
    let g:ackprg="/usr/local/bin/ack"
endif

" Ctrl-P show files and buffers
let g:ctrlp_extension = ['tag', 'mixed']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_relative = 1

" Integrate ack into vim via :Ack command
" Thanks saikobee
command! Wack exec 'Ack -w "' . expand('<cword>') . '"'

" K will ack for the text under the cursor
nnoremap K :Wack<CR>
vnoremap K <Nop>

map ,t :CtrlPTag<CR>
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_shortener = ['/home/.*/gems/', '.../']
"If there is only one tag found, it is possible to open it without opening CtrlP window:
let g:ctrlp_tjump_only_silent = 1

" easytags should use a project specific tags file
"set tags=./tags;
set tags=tags
" not sure if this next line is doing anything...
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_dynamic_files = 1
let g:easytags_async = 1
let g:easytags_always_enabled = 1
let g:easytags_events = ['BufWritePost']

"write backup files to a different directory
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" window movement
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" Move out of terminal window
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l


"airline
let g:airline_powerline_fonts = 1

"json
let g:vim_json_syntax_conceal = 0

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

"Git Fugitive
let g:fugitive_github_domains = ['https://github.banksimple.com']

" use <C-\><C-n> to escape terminal window
" remapping <ESC> to do this breaks fish vim mode

" New terminal with Fish shell
command Fish terminal exec fish

""Move to nvimrc
""neomake
"let g:neomake_open_list = 1
"let g:neomake_list_height = 10
"let g:neomake_verbose = 0
"let g:neomake_logfile = 'neomake.log'
"
"" 'errorformat': '%E%f:%l: %t%m,%Z%p^,%-G%.%#',
"
"let g:neomake_scala_fsclint_maker = {
"        \ 'exe': 'scalalint',
"        \ 'errorformat':
"            \ '%E%f:%l: %trror:%m,' .
"            \ '%W%f:%l: %tarning:%m,' .
"            \ '%Z%p^,' .
"            \ '%-G%.%#,',
"        \ 'args': [
"            \ '-Xfatal-warnings:false',
"            \ '-Xfuture',
"            \ '-Xlint',
"            \ '-Ywarn-adapted-args',
"            \ '-Ywarn-dead-code',
"            \ '-Ywarn-inaccessible',
"            \ '-Ywarn-infer-any',
"            \ '-Ywarn-nullary-override',
"            \ '-Ywarn-nullary-unit',
"            \ '-Ywarn-numeric-widen',
"            \ '-Ywarn-unused-import',
"            \ '-deprecation',
"            \ '-encoding UTF-8',
"            \ '-feature',
"            \ '-language:existentials',
"            \ '-language:higherKinds',
"            \ '-language:implicitConversions',
"            \ '-unchecked',
"            \ '-d /private/var/tmp/',
"        \ ]
"    \ }
""            \ '-Ywarn-value-discard',
"let g:neomake_scala_enabled_makers = ['fsclint']
