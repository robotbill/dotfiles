source ~/.vimrc

" use <C-\><C-n> to escape terminal window
" remapping <ESC> to do this breaks fish vim mode

" Move out of terminal window
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

command Fish terminal exec fish

"Move to nvimrc
"neomake
let g:neomake_open_list = 1
let g:neomake_list_height = 10
let g:neomake_verbose = 0
let g:neomake_logfile = 'neomake.log'

" 'errorformat': '%E%f:%l: %t%m,%Z%p^,%-G%.%#',

let g:neomake_scala_fsclint_maker = {
        \ 'exe': 'scalalint',
        \ 'errorformat':
            \ '%E%f:%l: %trror:%m,' .
            \ '%W%f:%l: %tarning:%m,' .
            \ '%Z%p^,' .
            \ '%-G%.%#,',
        \ 'args': [
            \ '-Xfatal-warnings:false',
            \ '-Xfuture',
            \ '-Xlint',
            \ '-Ywarn-adapted-args',
            \ '-Ywarn-dead-code',
            \ '-Ywarn-inaccessible',
            \ '-Ywarn-infer-any',
            \ '-Ywarn-nullary-override',
            \ '-Ywarn-nullary-unit',
            \ '-Ywarn-numeric-widen',
            \ '-Ywarn-unused-import',
            \ '-deprecation',
            \ '-encoding UTF-8',
            \ '-feature',
            \ '-language:existentials',
            \ '-language:higherKinds',
            \ '-language:implicitConversions',
            \ '-unchecked',
            \ '-d /private/var/tmp/',
        \ ]
    \ }
"            \ '-Ywarn-value-discard',
let g:neomake_scala_enabled_makers = ['fsclint']
