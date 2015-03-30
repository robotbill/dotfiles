syntax enable

set nocompatible
set encoding=utf-8

" Vundle
filetype off
"let $GIT_SSL_NO_VERIFY = 'true'
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
Plugin 'gmarik/vundle'

" My Plugins
Plugin 'vimwiki'
"Plugin 'matchit'
Plugin 'kien/ctrlp.vim'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'mileszs/ack.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bufexplorer.zip'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-fugitive'
Plugin 'derekwyatt/vim-scala'
Plugin 'elzr/vim-json'
Plugin 'Align'
Plugin 'GEverding/vim-hocon'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'sukima/xmledit'
Plugin 'scrooloose/nerdcommenter'
Plugin 'shime/vim-livedown'

"required for easytags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

call vundle#end()            " required
filetype plugin indent on    " required for Vundle

set noerrorbells
set visualbell
set matchpairs+=<:>
"set shortmess=a   " Use short messages
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
  if has("syntax") && &t_Co == 256
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
command! Wack exec 'Ack "' . expand('<cword>') . '"'

" K will ack for the text under the cursor
nnoremap K :Wack<CR>
vnoremap K <Nop>

" ctags go to definition with ,t
"map ,t :CtrlPTag<CR><C-\>w
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_shortener = ['/home/.*/gems/', '.../']
"If there is only one tag found, it is possible to open it without opening CtrlP window:
let g:ctrlp_tjump_only_silent = 1

" easytags should use a project specific tags file
"set tags=./tags;
set tags=./.tags,.tags,./tags,tags,./.easytags
" not sure if this next line is doing anything...
let g:easytags_file = './.easytags'
let g:easytags_dynamic_files = 1
let g:easytags_async = 1

"write backup files to a different directory
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" window movement
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

let g:vim_json_syntax_conceal = 0

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
