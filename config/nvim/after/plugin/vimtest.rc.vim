let test#strategy = 'neovim_sticky'
let test#neovim_sticky#reopen_window = 1
let g:test#javascript#jest#executable = 'pnpm jest'
" Fix for readline issue with binding.pry
let test#ruby#rspec#executable = 'RUBYOPT="-W0" rspec'

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
    let l:current_window = win_getid()
    let term_position = get(g:, 'test#neovim#term_position', 'botright')
    execute term_position . ' sbuffer ' . l:bufnr
    let l:win = win_findbuf(l:bufnr)
    call win_execute(l:win[0], 'normal G', 1)

    let l:new_window = win_getid()
    call win_gotoid(l:current_window)
  endif
endfun

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
nmap <silent> <leader>tc :call CloseTestWindow()<CR>
nmap <silent> <leader>to :call OpenTestWindow()<CR>
