" Vim color file
" help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" :highlight to show all hightlight groups
" :so $VIMRUNTIME/syntax/hitest.vim to test colors


set background=light
highlight clear
if exists("syntax_on")
  syntax reset
endif

set t_Co=256

set termguicolors
let g:colors_name="jml"

let s:black = "#000000"
let s:brblack = "#4c422f"

let s:red = "#9b0901"
let s:brred = "#cb312f"

let s:green = "#118800"
let s:brgreen = "#13C513"

let s:yellow = "#b16404"
let s:bryellow = "#eeb123"
let s:hlyellow = "#ffd027"

let s:blue = "#0451b1"
let s:brblue = "#2360ee"

let s:magenta = "#691d55"
let s:brmagenta = "#a11da0"

let s:cyan = "#01939b"
let s:brcyan = "#2fc9cb"

let s:darkoffwhite = "#e9e4da"
let s:offwhite = "#fffaf1"

let s:default = s:black

function! s:h(group, style, ...)
  let s:highlight = a:style
  if has_key(s:highlight, "gui") && !has_key(s:highlight, "cterm")
    let s:highlight.cterm = s:highlight.gui
  endif

  execute "highlight" a:group
    \ "guifg="   (has_key(s:highlight, "fg")    ? s:highlight.fg   : "NONE")
    \ "guibg="   (has_key(s:highlight, "bg")    ? s:highlight.bg   : "NONE")
    \ "guisp="   (has_key(s:highlight, "sp")    ? s:highlight.sp   : "NONE")
    \ "gui="     (has_key(s:highlight, "gui")   ? s:highlight.gui  : "NONE")
    \ "cterm="   (has_key(s:highlight, "cterm") ? s:highlight.cterm    : "NONE")
endfunction

call s:h("Normal", { 'fg': s:default })
call s:h('Comment', { 'fg': s:brblack, 'bg': s:darkoffwhite, 'gui': 'italic', 'cterm': 'italic' })

call s:h("Constant", { 'fg': s:yellow })
call s:h("String", { 'fg': s:blue })
" Character
call s:h("Number", { 'fg': s:cyan })
" Boolean
" Float

call s:h("Identifier", { 'fg': s:brblue })

call s:h("Function", { 'fg': s:brblue })
" call s:h("@variable", { 'fg': s:default })

call s:h("Statement", { 'fg': s:green, 'gui': 'bold' })
" Conditional
" Repeat
" Label
call s:h("Operator", { 'fg': s:brmagenta })
" Keyword
" Exception

call s:h("PreProc", { 'fg': s:red, 'gui': 'bold' })
" Include
" Define
" Macro
" PreCondit

call s:h("Type", { 'fg': s:magenta, 'gui': 'italic' })
" StorageClass
" Structure
" Typedef

call s:h("Special", { 'fg': s:brcyan })
" SpecialChar
" Tag
call s:h("Delimiter", { 'fg': s:red })
" SpecialComment
" Debug

call s:h("Underlined", { 'fg': s:brblue, 'gui': 'underline' })

call s:h("Ignore", { 'fg': s:brmagenta })

call s:h("Error", { 'fg': s:offwhite, 'bg': s:brred })
call s:h("NvimInternalError", { 'fg': s:brred, 'bg': s:brred })

" TODO: make this better
" FIXME: fix it
call s:h("Todo", { 'fg': s:brblack, 'bg': s:darkoffwhite, 'gui': 'bold' })

call s:h("ColorColumn", { 'bg': s:darkoffwhite })
call s:h("Directory", { 'fg': s:yellow })

call s:h("DiffAdd", { 'fg': s:green })
call s:h("DiffChange", { 'fg': s:magenta })
call s:h("DiffDelete", { 'fg': s:brred })
call s:h("DiffText", { 'fg': s:red })

call s:h("ErrorMsg", { 'fg': s:red, 'bg': s:bryellow })
call s:h("Vertsplit", { 'fg': s:brblack })

call s:h("Folded", { 'fg': s:brblack, 'bg': s:offwhite })
call s:h("FoldColumn", { 'fg': s:brblack, 'bg': s:offwhite })

call s:h("IncSearch", { 'fg': s:magenta, 'bg': s:hlyellow })
call s:h("CurSearch", { 'fg': s:magenta, 'bg': s:hlyellow })
call s:h("Search", { 'fg': s:magenta, 'bg': s:bryellow })

call s:h("LineNr", { 'fg': s:yellow, 'gui': 'bold' })
call s:h("MatchParen", { 'fg': s:default, 'bg': s:brcyan })
call s:h("ModeMsg", { 'fg': s:brred })
call s:h("MoreMsg", { 'fg': s:green })
call s:h("NonText", { 'fg': s:default })
call s:h("Question", { 'fg': s:green })
call s:h("SpecialKey", { 'fg': s:green })
call s:h("SpellBad", { 'gui': 'undercurl', 'sp': s:brred })

call s:h("StatusLine", { 'fg': s:brblack, 'bg': s:darkoffwhite })
call s:h("StatusLineNC", { 'fg': s:offwhite, 'bg': s:brblack })

call s:h("Title", { 'fg': s:default, 'bg': s:darkoffwhite, 'gui': 'bold' })

call s:h("Visual", { 'fg': s:offwhite, 'bg': s:brblack })
call s:h("VisualNOS", { 'fg': s:offwhite, 'bg': s:brblack })

call s:h("WarningMsg", { 'fg': s:blue })
call s:h("WildMenu", { 'fg': s:default, 'bg': s:green })

call s:h("SignColumn", { 'fg': s:default })

call s:h("Pmenu", { 'fg': s:red, 'bg': s:darkoffwhite })
call s:h("PmenuSel", { 'fg': s:offwhite, 'bg': s:brblack })
call s:h("PmenuSbar", { 'bg': s:darkoffwhite })
call s:h("PmenuThumb", { 'fg': s:darkoffwhite, 'bg': s:brblack })

call s:h("NormalFloat", { 'bg': s:darkoffwhite })

call s:h("CursorColumn", { 'bg': s:brblack, 'fg': s:offwhite })
call s:h("CursorLine", { 'bg': s:brblack, 'fg': s:offwhite })
call s:h("Cursor", { 'fg': s:brblack })
call s:h("lCursor", { 'fg': s:brblack })
call s:h("RedrawDebugNormal", { 'bg': s:brblack, 'fg': s:offwhite })
call s:h("TabLineSel", { 'fg': s:brblack })

call s:h("QuickFixLine", { 'fg': s:green })

" Git Fugitive
hi link diffAdded diffAdd
hi link diffRemoved diffDelete
