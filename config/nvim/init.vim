set encoding=utf-8

set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'Chiel92/vim-autoformat'
Plug 'GEverding/vim-hocon'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fntlnz/atags.vim'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'jlanzarotta/bufexplorer'
Plug 'kien/rainbow_parentheses.vim', { 'for': ['clojure'] }
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'
Plug 'rhysd/committia.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'previm/previm'
Plug 'sukima/xmledit', { 'for': 'xml' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vimwiki/vimwiki'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hashivim/vim-terraform'

call plug#end()

set noerrorbells
set visualbell
set matchpairs+=<:>
set showmatch    " Show matching brackets when typing
set smartcase
set textwidth=0  " Don't automatically wrap lines
set backspace=2  " Allow backspacing over everything in insert mode
set history=500
set cmdheight=2
set scrolloff=1
set title
set ruler
set showcmd
set hidden
set virtualedit=block
set wrap
set whichwrap=b,s,h,l,<,>,[,] " No left/right key should have to stop at line breaks

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent

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

let mapleader = ","

" Automatically load changes
set autoread

let g:python_host_prog  = "/usr/local/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"

" mousing
set mouse=nvi
map <F1> <Esc>:set mouse=<CR>
map <F2> <Esc>:set mouse=nvi<CR>

" disable incremental search and replace
set inccommand=""

" write backup files to a different directory
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Colors
set background=light
colorscheme jml
let &colorcolumn=join(range(100,100),",")

" Don't move cursor when typing *. (from emilyst)
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
vnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

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

"escape out of terminal mode
:tnoremap <A-[> <C-\><C-n>

augroup text
    autocmd!
    autocmd BufRead,BufNewFile *.wiki setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufNewFile,BufRead *txt,*.html,*.tex,README setlocal spell
    "Markdown
    autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
    autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=80
    "Vimwiki
    autocmd BufNewFile,BufRead *.wiki setlocal textwidth=80
    autocmd BufNewFile,BufRead *.wiki setlocal foldmethod=expr
    "API bluepring
    autocmd BufNewFile,BufRead *.apib setlocal textwidth=80
augroup end

augroup scala
    autocmd!
    autocmd BufRead,BufNewFile *.scala,*.sbt setlocal filetype=scala
    autocmd BufRead,BufNewFile *.scala,*.sbt setlocal shiftwidth=2
    autocmd BufRead,BufNewFile *.scala,*.sbt setlocal softtabstop=2
    autocmd BufWritePost *.scala,*.sbt call atags#generate()
augroup end

augroup python
    autocmd!
    autocmd BufWritePost *.py Neomake
augroup end

augroup ruby
    autocmd!
    autocmd BufWritePost *.rb Neomake
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2
    autocmd BufNewFile,BufRead *.rb setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.rb setlocal shiftwidth=2
augroup end

augroup java
    autocmd!
    autocmd BufWritePost *.java call atags#generate()
    autocmd BufRead,BufNewFile *.java setlocal filetype=java
    autocmd BufNewFile,BufRead *.java setlocal tabstop=2
    autocmd BufNewFile,BufRead *.java setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.java setlocal shiftwidth=2
augroup end

augroup javascript
    autocmd!
    autocmd BufRead,BufNewFile *.js setlocal filetype=javascript
    autocmd BufNewFile,BufRead *.js setlocal tabstop=2
    autocmd BufNewFile,BufRead *.js setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.js setlocal shiftwidth=2
augroup end

augroup haskell
    autocmd!
    autocmd BufNewFile,BufRead *.hs,*.lhs setlocal tabstop=4
    autocmd BufNewFile,BufRead *.hs,*.lhs setlocal softtabstop=4
    autocmd BufNewFile,BufRead *.hs,*.lhs setlocal shiftwidth=4
augroup end

augroup html
    autocmd!
    autocmd BufNewFile,BufRead *.html,*.html.erb setlocal tabstop=2
    autocmd BufNewFile,BufRead *.html,*.html.erb setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.html,*.html.erb setlocal shiftwidth=2
augroup end

augroup tex
    autocmd!
    autocmd BufNewFile,BufRead *.tex set tw=80
augroup end

augroup googlego
    autocmd!
    autocmd BufNewFile,BufRead *.go set syntax=go noexpandtab si
augroup end

augroup objectivec
    autocmd!
    autocmd BufNewFile,BufRead *.m vmap ,: :<C-U>AlignCtrl rlp0P0\|<CR>:'<,'>Align :<CR>
augroup end

augroup clojure
    autocmd!
    autocmd BufRead,BufNewFile *.clj,*.clojure setlocal filetype=clojure
    autocmd BufEnter *.clj RainbowParenthesesToggle
    autocmd BufLeave *.clj RainbowParenthesesToggle
    autocmd Syntax *.clj RainbowParenthesesLoadBraces
    autocmd Syntax *.clj RainbowParenthesesLoadRound
    autocmd Syntax *.clj RainbowParenthesesLoadSquare
    autocmd Syntax *.clojure RainbowParenthesesLoadBraces
    autocmd Syntax *.clojure RainbowParenthesesLoadRound
    autocmd Syntax *.clojure RainbowParenthesesLoadSquare
augroup end

augroup terraform
    autocmd!
    autocmd BufRead,BufNewFile *.tf setlocal filetype=terraform
    autocmd BufRead,BufNewFile *.tf setlocal shiftwidth=2
    autocmd BufRead,BufNewFile *.tf setlocal softtabstop=2
augroup end

"Latex-Suite
let g:Tex_ViewRule_pdf = 'Preview'
let g:tex_flavor='latex'

" neomake
let g:neomake_python_python_exe = 'python3'

" Yank to end of the line
nmap Y y$
" Yank visually selected block then comment out
vmap ,yc ygv:normal i#<CR>
map ; q:

" Copy selection into system copy buffer
vmap <leader>x "*y

" make * work in visual mode
vmap * y:let@/=@"<CR>n

" Ctrl-P show files and buffers
let g:ctrlp_extension = ['tag', 'mixed']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_mruf_relative = 1

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  let g:ackprg='ag --nogroup --nocolor --column'
endif

" Completion
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Ctag navigation
map <leader>t :CtrlPTag<CR>
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
"If there is only one tag found, it is possible to open it without opening CtrlP window:
let g:ctrlp_tjump_only_silent = 1

"airline
let g:airline_powerline_fonts = 1

"json
let g:vim_json_syntax_conceal = 0

"Git Fugitive
let g:github_enterprise_urls = ['https://github.banksimple.com']

" New terminal with Fish shell
command! Fish terminal exec fish

" autoformat
let g:formatters_scala = ['scalafmt']
let g:formatdef_scalafmt = '"scalafmt --config .scalafmt.conf --stdin 2>/dev/null"'

" grepper
nmap gs <plug>(GrepperOperator)
nmap gs <plug>(GrepperOperator)
" K searches for word under the current character
nmap K gsiw

" vimwiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sql': 'sql', 'xml': 'xml', 'scala': 'scala', 'json': 'json', 'java': 'java'}
let g:vimwiki_list = [wiki]
let g:vimwiki_folding='expr'

" Snippets

let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/ultisnips/"

" previm
let g:previm_open_cmd = 'open -a Firefox'
