syntax enable

set nocompatible
set encoding=utf-8

" Vundle
filetype off
let $GIT_SSL_NO_VERIFY = 'true'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'vimwiki'
"Bundle 'matchit'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bufexplorer.zip'
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-fugitive'
Bundle 'derekwyatt/vim-scala'
Bundle 'elzr/vim-json'
Bundle 'Align'
Bundle 'GEverding/vim-hocon'
Bundle 'ConradIrwin/vim-bracketed-paste'

"required for easytags
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
" End vundle

filetype plugin indent on

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

set shiftwidth=4
set expandtab
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

"set working directory to current buffer
"autocmd BufEnter * lcd %:p:h

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
    let &colorcolumn=join(range(120,120),",")
"    colorscheme solarized
  else
"    colorscheme cbc
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
  augroup END
endif

au! BufRead,BufNewFile *.wiki setlocal spell
au! BufRead,BufNewFile *.md setlocal spell

"scala
au! BufRead,BufNewFile *.scala setlocal shiftwidth=2
au! BufRead,BufNewFile *.scala setlocal softtabstop=2

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
map ,t :CtrlPTag<CR><C-\>w

" easytags should use a project specific tags file
:set tags=./tags;
:let g:easytags_dynamic_files = 1

"write backup files to a different directory
set backupdir=~/.vim/backup
set directory=~/.vim/backup


:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
