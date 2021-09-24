set encoding=utf-8

" }}}
" Plugins ----------------------------------------------------------------- {{{
call plug#begin(stdpath('data') . '/plugged')

" Visual
Plug 'bling/vim-airline'

" Notes
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" Snippets
Plug 'SirVer/ultisnips'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" LSP
Plug 'neovim/nvim-lspconfig'

" Auto-Completion
Plug 'hrsh7th/nvim-compe'

" Experimental
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language Support
Plug 'dag/vim-fish'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-markdown'

" Testing
Plug 'vim-test/vim-test'

Plug 'previm/previm'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'

call plug#end()

" }}}
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
set background = "light"
colorscheme jml
let &colorcolumn=join(range(81,81),",")

let g:airline_powerline_fonts = 1

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
vmap ,yc ygv:normal i#<CR>

" Open vim command-line window with ;
map ; q:

" Copy selection into system copy buffer
vmap <leader>x "*y

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
    autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
    autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=80
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
    autocmd BufRead,BufNewFile *.js,*.ts setlocal filetype=javascript
    autocmd BufNewFile,BufRead *.js,*.ts setlocal tabstop=2
    autocmd BufNewFile,BufRead *.js,*.ts setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.js,*.ts setlocal shiftwidth=2
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

" }}}
" Plugin Configuration ---------------------------------------------------- {{{

" Vimwiki
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
let wiki.path_html = '~/vimwiki/site_html/'
let wiki.custom_wiki2html = 'vimwiki_markdown'
let wiki.html_filename_parameterization = 1
let wiki.template_ext = '.html'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sql': 'sql', 'xml': 'xml', 'scala': 'scala', 'json': 'json', 'java': 'java'}
let g:vimwiki_list = [wiki]
"let g:vimwiki_folding='expr'
let g:vimwiki_folding=''
let g:vimwiki_global_ext=0  " Don't turn all markdown files into vimwikis

" Previm
let g:previm_open_cmd = 'open -a Firefox'

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.config/nvim/ultisnips/"

" test.vim
let test#strategy = 'neovim'
let test#ruby#use_spring_binstub = 1
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>gt :TestVisit<CR>

" fzf
" Replace CtrlP
nmap <C-p> :Files<CR>
"map <leader>t :Tags<CR>
" Replace Bufexplorer
map <leader>be :Buffers<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Telescope
"nnoremap <C-p> <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>be <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <leader>fs <cmd>Telescope grep_string<cr>


" Completion with Compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.ultisnips = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF


" }}}
" Skipped from old configuration ------------------------------------------ {{{
