" Vim color file
" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors



set background=light
" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="jml"

" color terminal definitions
hi Normal           ctermfg=black
hi SpecialKey       ctermfg=darkgreen
hi NonText          ctermfg=black       ctermbg=white
hi Directory        ctermfg=130
hi ErrorMsg         ctermfg=196         ctermbg=226
hi IncSearch        ctermfg=black      ctermbg=178
hi Search           ctermfg=black       ctermbg=178
hi MoreMsg          ctermfg=darkgreen
hi ModeMsg          ctermfg=red
hi LineNr           ctermfg=yellow      ctermbg=darkgrey
hi Question         ctermfg=darkgreen
hi StatusLine       ctermfg=238         ctermbg=white
hi StatusLineNC     ctermfg=252         ctermbg=240
hi VertSplit        ctermfg=238         ctermbg=white
hi Title            ctermfg=196         ctermbg=226
hi Visual           cterm=reverse
hi VisualNOS        cterm=reverse
hi WarningMsg       ctermfg=darkblue
hi WildMenu         ctermfg=black       ctermbg=darkcyan
hi Folded           ctermfg=238         ctermbg=251
hi FoldColumn       ctermfg=238         ctermbg=251
"hi DiffAdd          ctermfg=20          ctermbg=20
"hi DiffChange       ctermfg=130         ctermbg=130
"hi DiffDelete       ctermfg=160         ctermbg=160
"hi DiffText         ctermfg=20          ctermbg=20
hi DiffAdd          ctermfg=20
hi DiffChange       ctermfg=130
hi DiffDelete       ctermfg=160
hi DiffText         ctermfg=20

hi Comment          ctermfg=232         ctermbg=254 cterm=BOLD
hi Constant         ctermfg=166
hi Special          ctermfg=104
hi Identifier       cterm=NONE ctermfg=17
hi Statement        cterm=BOLD ctermfg=22
hi Operator         ctermfg=90
hi PreProc          ctermfg=18
hi Type             ctermfg=126
"hi Underlined       ctermbg=28          ctermfg=18
hi Underlined       cterm=underline     ctermfg=21 ctermbg=254
hi Ignore           ctermfg=129
hi Error            ctermfg=white       ctermbg=160
hi Todo             ctermfg=white       ctermbg=darkgreen
hi String           ctermfg=25
hi Number           ctermfg=130
"hi LineNr           ctermfg=darkyellow  ctermbg=white cterm=bold
hi LineNr           ctermfg=darkyellow  ctermbg=255 cterm=bold
hi ColorColumn      ctermbg=255
