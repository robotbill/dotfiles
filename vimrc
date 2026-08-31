syntax enable

set nocompatible
set encoding=utf-8

if empty(glob('~/.vim' . '/autoload/plug.vim'))
  silent execute '!curl -fLo .vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'
" Completion & Diagnostics
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Language Support
Plug 'dag/vim-fish'
Plug 'elzr/vim-json',
Plug 'tpope/vim-markdown'
Plug 'fladson/vim-kitty'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },
                                     \ 'for': ['markdown', 'vim-plug']}

" Testing
Plug 'vim-test/vim-test'

call plug#end()

" Basic Options ----------------------------------------------------------- {{{
set noerrorbells
set novisualbell
set belloff=all
set showmatch                   " Show matching brackets when typing
set matchpairs+=<:>             " Add pair matching for html
set textwidth=0                 " Don't automatically wrap lines
set backspace=indent,eol,start  " Allow back
set hidden                      " Hides instead of closing buffers with unsaved changes
set virtualedit=block           " Allow cursor to be where there is no actual char in block mode
set wrap                        " Softwrap long lines
set whichwrap=b,s,h,l,<,>,[,]   " Allow left/right movement keys to move past line breaks
set list listchars=tab:>-,extends:>,precedes:<,trail:· " Show non printing characters sometimes
set mouse=nvi                   " Allow mousing in normal, visual, and insert mode
set laststatus=2                " Always show the status line

set autoread                    " Automatically load file changes

set history=1000                " Remember N lines of command line history
set wildmenu                    " Enable wildmenu for cli completion (default)
set wildmode=list:longest       " Complete up to longest, list all matches

let mapleader=","               " Set <leader> to ','

set backupdir=~/.vim/backup     " Write backup files to a different directory
set directory=~/.vim/backup     " Write swap files to a different directory

set shell=/bin/bash             " Maybe this will make things faster??

" }}}

" Searching --------------------------------------------------------------- {{{
set ignorecase                  " Ignore case when searching
set smartcase                   " if all terms are lowercase
set noincsearch                 " Disable incremental search (default)
set hlsearch

" Don't move cursor when initially typing '*' in normal mode. (from emilyst)
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
vnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" make '*' work in visual mode
vmap * y:let@/=@"<CR>n

" }}}
" Tabbing ----------------------------------------------------------------- {{{
set expandtab                   " Turn tabs into spaces
set tabstop=2                   " Tabs are 2 spaces
set shiftwidth=2                " Number of spaces to use for auto indent
set smarttab
set autoindent

" }}}
" Visual Changes ---------------------------------------------------------- {{{
set background=light
colorscheme jml
let &colorcolumn=join(range(84,84),",")

"let g:airline_powerline_fonts = 1

set cmdheight=2                 " Use two lines for the command line
set scrolloff=1                 " Keep at least 1 line above or below the cursor
set title                       " Set the window title using the file, etc.
set ruler                       " Show cursor position in status
set number                      " Show line numbers
set statusline=[%n]\ %F\ %(\ %M%R%H)%)\ \@(%l\,%c%V)\ %P " Status line pattern (TODO document this)

" }}}
" Shortcuts --------------------------------------------------------------- {{{
" Y yanks to end of the line
nmap Y y$

" Yank visually selected block then comment out
vmap <leader>yc ygv:normal gcc<CR>

" Open vim command-line window with ;
map ; q:

" Copy selection into system copy buffer
vmap <leader>x "*y

" Copy current file's relative path to system copy buffer
nnoremap <silent> <leader>g% :let @+=expand('%')<CR>

" Can move between windows using Alt and direction
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" }}}

" Filetypes --------------------------------------------------------------- {{{"
filetype indent plugin on

augroup text
    autocmd!
    autocmd BufRead,BufNewFile *.wiki setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufNewFile,BufRead *txt,*.html,*.tex,README setlocal spell
    "Markdown
    autocmd BufRead,BufNewFile *.md,*.markdown setlocal filetype=markdown
    autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=80
    autocmd BufNewFile,BufRead *.md,*.markdown setlocal nowrap
    "Vimwiki
    autocmd BufNewFile,BufRead *.wiki setlocal textwidth=80
    autocmd BufNewFile,BufRead *.wiki setlocal foldmethod=expr
    "API blueprint
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
    autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
augroup end

augroup ruby
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2
    autocmd BufNewFile,BufRead *.rb setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.rb setlocal shiftwidth=2
augroup end

augroup lua
    autocmd!
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2
    autocmd BufNewFile,BufRead *.rb setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.rb setlocal shiftwidth=2
augroup end

augroup yaml
    autocmd!
    autocmd BufNewFile,BufRead *.yml,*.yaml setlocal tabstop=2
    autocmd BufNewFile,BufRead *.yml,*.yaml setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.yml,*.yaml setlocal shiftwidth=2
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
    autocmd BufNewFile,BufRead *.js,*.ts,*.tsx setlocal tabstop=2
    autocmd BufNewFile,BufRead *.js,*.ts,*.tsx setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.js,*.ts,*.tsx setlocal shiftwidth=2
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

augroup css
    autocmd!
    autocmd BufNewFile,BufRead *.css,*.scss setlocal tabstop=2
    autocmd BufNewFile,BufRead *.css,*.scss setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.css,*.scss setlocal shiftwidth=2
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

augroup jinja
    au BufNewFile,BufRead *.njk set filetype=jinja
    autocmd BufRead,BufNewFile *.njk setlocal shiftwidth=2
    autocmd BufRead,BufNewFile *.njk setlocal softtabstop=2
augroup end

" }}}

"if has('unix')
"    set bk bdir=.,~/.vimbak,/tmp,/var/tmp       " Backup settings
"    set     dir=.,~/.vimswp,/tmp,/var/tmp       " Swap file
"endif

"
""write backup files to a different directory
"set backupdir=~/.vim/backup
"set directory=~/.vim/backup

" FZF ----------------------------------------------------------- {{{
" Replace CtrlP
nmap <C-p> :Files<CR>
"map <leader>t :Tags<CR>
" Replace Bufexplorer
map <leader>be :Buffers<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Vim Wiki ------------------------------------------------------ {{{
let g:vimwiki_list = [{ 'path': '~/vimwiki/',
                      \ 'syntax': 'markdown',
                      \ 'ext': '.md',
                      \ 'path_html': '~/vimwiki/site_html/',
                      \ 'custom_wiki2html': 'vimwiki_markdown',
                      \ 'html_filename_parameterization': 1,
                      \ 'template_ext': '.html'}]
let g:vimwiki_folding = ''
" Don't turn all markdown files into vimwikis
let g:vimwiki_global_ext = 0
" }}}

" Vim Test ------------------------------------------------------ {{{
let test#strategy = 'basic'
let g:test#javascript#jest#executable = 'pnpm jest'
" Fix for readline issue with binding.pry
let test#ruby#rspec#executable = 'RUBYOPT="-W0" rspec'

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
" }}}

" LSP ------------------------------------------------------ {{{
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'allowlist': ['ruby'],
        \ })
endif

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'allowlist': ['typescript', 'typescript.tsx', 'typescriptreact'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    " nmap <buffer> gs <plug>(lsp-document-symbol-search)
    " nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> <leader>D <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>p <plug>(lsp-previous-diagnostic)
    nmap <buffer> <leader>n <plug>(lsp-next-diagnostic)
    nmap <buffer> <C-k> <plug>(lsp-hover)
    nmap <buffer> <leader>f <plug>(lsp-document-format)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    " let g:lsp_format_sync_timeout = 1000
    " autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    "let g:lsp_diagnostics_virtual_text_align = 'right'
    let g:lsp_document_highlight_enabled = 0
augroup END

" }}}

" Asyn Complete--------------------------------------------- {{{
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" }}}


vmap <leader>fs !sqlformat --reindent --keywords upper --identifiers lower -<CR>
