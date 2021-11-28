-- Vim color file
-- cool help screens
-- :he group-name
-- :he highlight-groups
-- :he cterm-colors

vim.cmd [[
  highlight clear
  syntax reset
  set termguicolors
]]

vim.g.colors_name = "jml"
vim.opt.background = "light"

local black = "#000000"
local offblack = "#4C422F"

local red = "#9B0901"
local lightred = "#CB312F"

local green = "#009728"
local lightgreen = "#25BC26"

local yellow = "#B16404"
local lightyellow = "#FF8A1A"

local blue = "#0451b1"
local lightblue = "#0451B1"

local magenta = "#97006F"
local lightmagenta = "#BC25BC"

local cyan = "#01939B"
local lightcyan = "#2FC9CB"

local darkoffwhite = "#e9e4da"
local offwhite = "#fffaf1"

local default = black

local hi = function(group, opts)
  vim.cmd(
    string.format("hi %s guifg=%s guibg=%s gui=%s guisp=%s",
      group,
      opts.fg or default,
      opts.bg or "NONE",
      opts.gui or "NONE", 
      opts.sp or "NONE"
    )
  )
end

local link = function(from, to)
  vim.cmd(string.format("hi! link %s %s", from, to))
end

hi("Normal", { fg = normal })

hi("Comment", { fg = offblack, bg = darkoffwhite, gui = "italic" })

hi("Constant", { fg = yellow })
hi("String", { fg = blue })
-- Character
hi("Number", { fg = cyan })
-- Boolean
-- Float

hi("Identifier", { fg = lightblue })
-- Function

hi("Statement", { fg = green, gui = "bold" })
-- Conditional
-- Repeat
-- Label
hi("Operator", { fg = lightmagenta })
-- Keyword
-- Exception

hi("PreProc", { fg = red, gui = "bold" })
-- Include
-- Define
-- Macro
-- PreCondit

hi("Type", { fg = magenta, gui = "italic" })
-- StorageClass
-- Structure
-- Typedef

hi("Special", { fg = lightcyan })
-- SpecialChar
-- Tag
-- Delimiter
-- SpecialComment
-- Debug

hi("Underlined", { fg = lightblue, gui = "underline" })

hi("Ignore", { fg = lightmagenta })

hi("Error", { fg = offwhite, bg = red })

-- TODO: make this better
-- FIXME: fix it
hi("Todo", { fg = offblack, bg = darkoffwhite, gui = "bold" })

hi("ColorColumn", { bg = darkoffwhite })
hi("Directory", { fg = yellow })

hi("DiffAdd", { fg = green })
hi("DiffChange", { fg = magenta })
hi("DiffDelete", { fg = lightred })
hi("DiffText", { fg = red })

hi("ErrorMsg", { fg = red, bg = lightyellow })
hi("Vertsplit", { fg = offblack })

hi("Folded", { fg = offblack, bg = offwhite })
hi("FoldColumn", { fg = offblack, bg = offwhite })

hi("IncSearch", { fg = normal, bg = lightyellow })
hi("Search", { fg = normal, bg = lightyellow })

hi("LineNr", { fg = yellow, bg = darkoffwhite, gui = "bold" })
hi("MatchParen", { fg = normal, bg = lightcyan })
hi("ModeMsg", { fg = lightred })
hi("MoreMsg", { fg = green })
hi("NonText", { fg = normal })
hi("Question", { fg = green })
hi("SpecialKey", { fg = green })
hi("SpellBad", { gui = "undercurl", sp = lightred })

hi("StatusLine", { fg = offblack })
hi("StatusLineNC", { fg = offwhite, bg = offblack })

hi("Title", { fg = normal, bg = darkoffwhite, gui = "bold" })

hi("Visual", { fg = offwhite, bg = offblack })
hi("VisualNOS", { fg = offwhite, bg = offblack })

hi("WarningMsg", { fg = blue })
hi("WildMenu", { fg = normal, bg = green })

hi("SignColumn", { fg = normal })

hi("Pmenu", { fg = red, bg = darkoffwhite })
hi("PmenuSel", { fg = offwhite, bg = offblack })
hi("PmenuSbar", { bg = darkoffwhite })
hi("PmenuThumb", { bg = offblack })

-- LSP
hi("LspDiagnosticsSignError", { fg = lightred })
hi("LspDiagnosticsSignWarning", { fg = yellow })
hi("LspDiagnosticsSignInformation", { fg = lightgreen })
hi("LspDiagnosticsSignHint", { fg = lightblue })

hi("LspDiagnosticsDefaultError", { fg = normal })
hi("LspDiagnosticsDefaultWarning", { fg = normal })
hi("LspDiagnosticsDefaultInformation", { fg = normal })
hi("LspDiagnosticsDefaultHint", { fg = normal })


-- Git Fugitive
link("diffAdded", "diffAdd")
link("diffRemoved", "diffDelete")

-- Feline
hi("JMLFelineDefault", { fg = offwhite, bg = offblack })
hi("JMLFelineFileInfo", { fg = yellow, bg = darkoffwhite, gui = "bold" })
hi("JMLFelineInactive", { fg = yellow, bg = darkoffwhite, gui = "bold" })
hi("JMLFelineGit", { fg = lightyellow, gui = "bold" })

-- nvim-cmp
hi("CmpItemKind", { fg = cyan, bg = darkoffwhite })
