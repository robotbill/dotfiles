" fzf
" Replace CtrlP
nmap <C-p> :Files<CR>
"map <leader>t :Tags<CR>
" Replace Bufexplorer
map <leader>be :Buffers<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'LineNr'],
  \ 'fg+':     ['fg', 'Comment'],
  \ 'bg+':     ['bg', 'Comment'],
  \ 'hl+':     ['fg', 'LineNr'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
