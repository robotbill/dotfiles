let test#strategy = 'neovim_sticky'
let test#neovim_sticky#reopen_window = 1
let test#neovim#term_position = "botright 25"
let g:test#javascript#jest#executable = 'pnpm jest'
" Fix for readline issue with binding.pry
let test#ruby#rspec#executable = 'RUBYOPT="-W0" bundle exec rspec'

function! s:findTestBuffer()
  let l:tag = '_test_vim_neovim_sticky'
  let l:buffers = getbufinfo({ 'buflisted': 1 })
    \ ->filter({i, v -> has_key(v.variables, l:tag)})
  if len(l:buffers)
    return l:buffers[0].bufnr
  else
    return 0
endfun

function! CloseTestWindow()
  let l:bufnr = s:findTestBuffer()
  if l:bufnr
      let l:win = win_findbuf(l:bufnr)
      if len(l:win) > 0
        call win_execute(l:win[0], 'close', 1)
      endif
  endif
endfun

function! OpenTestWindow()
  let l:bufnr = s:findTestBuffer()
  if l:bufnr
    " Copied from vim-test s:neovim_reopen_term
    " https://github.com/vim-test/vim-test/blob/bc0e94059de40641d163516a83c63bc45c716acf/autoload/test/strategy.vim#L90-L101
    let l:current_window = win_getid()
    let term_position = get(g:, 'test#neovim#term_position', 'botright')
    execute term_position . ' new'
    " we need to unload the no name buffer we just created
    let l:current_buffer = bufnr("%")
    execute 'buffer ' . l:bufnr . ' | bunload ' . l:current_buffer

    let l:new_window = win_getid()
    call win_gotoid(l:current_window)
    return l:new_window
  endif
endfun

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
nmap <silent> <leader>tc :call CloseTestWindow()<CR>
nmap <silent> <leader>to :call OpenTestWindow()<CR>
