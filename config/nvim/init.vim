set encoding=utf-8

" Basic Options ----------------------------------------------------------- {{{
set noerrorbells
set visualbell
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

set autoread                    " Automatically load file changes

set history=1000                " Remember N lines of command line history
set wildmenu                    " Enable wildmenu for cli completion (default)
set wildmode=list:longest       " Complete up to longest, list all matches

let mapleader=","               " Set <leader> to ','

set backupdir=~/.vim/backup     " Write backup files to a different directory
set directory=~/.vim/backup     " Write swap files to a different directory

set shell=/bin/bash             " Maybe this will make things faster??

" }}}
" Python Provider Configuration ------------------------------------------- {{{
let g:python_host_prog  = "/usr/local/bin/python"
let g:python3_host_prog = "/usr/local/bin/python3"
" TODO consider setting up a virtual env for neovim
" see: https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
" Disable Ruby Provider (for better performance?)
let g:loaded_ruby_provider = 0

" }}}
" Searching --------------------------------------------------------------- {{{
set ignorecase                  " Ignore case when searching
set smartcase                   " if all terms are lowercase
set inccommand=""               " Disable incremental search (default)

" Don't move cursor when initially typing '*' in normal mode. (from emilyst)
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
vnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" make '*' work in visual mode
vmap * y:let@/=@"<CR>n

" }}}
" Tabbing ----------------------------------------------------------------- {{{
set expandtab                   " Turn tabs into spaces
set tabstop=4                   " Tabs are 4 spaces
set shiftwidth=4                " Number of spaces to use for auto indent

" }}}
" Visual Changes ---------------------------------------------------------- {{{
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

" Works for moving out of a terminal window too
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Escape out of terminal mode with Alt-[
:tnoremap <A-[> <C-\><C-n>

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
" Plugin Configuration ---------------------------------------------------- {{{

lua require('plugins')

lua << EOF
vim.api.nvim_create_autocmd({'OptionSet', 'VimEnter'}, {
  pattern = 'background',
  callback = function(event)
    if vim.o.background == "dark" then
      vim.cmd 'colorscheme catppuccin-frappe'
    else
      vim.cmd 'colorscheme jml'
    end
  end
})
EOF
" Explicitly set theme to jml to make lualine happy
" until I figure out why it's unhappy without this.
colorscheme jml

" LuaSnip
lua local sl = require("luasnip.extras.snippet_list")
lua require("luasnip.loaders.from_snipmate").load()

vmap <leader>fs !sqlformat --reindent --keywords upper --identifiers lower -<CR>
