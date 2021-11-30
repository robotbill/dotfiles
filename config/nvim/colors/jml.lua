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
local brblack = "#4c422f"

local red = "#9b0901"
local brred = "#cb312f"

local green = "#118800"
local brgreen = "#13C513"

local yellow = "#b16404"
local bryellow = "#eeb123"

local blue = "#0451b1"
local brblue = "#2360ee"

local magenta = "#691d55"
local brmagenta = "#a11da0"

local cyan = "#01939b"
local brcyan = "#2fc9cb"

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

hi("Comment", { fg = brblack, bg = darkoffwhite, gui = "italic" })

hi("Constant", { fg = yellow })
hi("String", { fg = blue })
-- Character
hi("Number", { fg = cyan })
-- Boolean
-- Float

hi("Identifier", { fg = brblue })
-- Function

hi("Statement", { fg = green, gui = "bold" })
-- Conditional
-- Repeat
-- Label
hi("Operator", { fg = brmagenta })
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

hi("Special", { fg = brcyan })
-- SpecialChar
-- Tag
-- Delimiter
-- SpecialComment
-- Debug

hi("Underlined", { fg = brblue, gui = "underline" })

hi("Ignore", { fg = brmagenta })

hi("Error", { fg = offwhite, bg = red })

-- TODO: make this better
-- FIXME: fix it
hi("Todo", { fg = brblack, bg = darkoffwhite, gui = "bold" })

hi("ColorColumn", { bg = darkoffwhite })
hi("Directory", { fg = yellow })

hi("DiffAdd", { fg = green })
hi("DiffChange", { fg = magenta })
hi("DiffDelete", { fg = brred })
hi("DiffText", { fg = red })

hi("ErrorMsg", { fg = red, bg = bryellow })
hi("Vertsplit", { fg = brblack })

hi("Folded", { fg = brblack, bg = offwhite })
hi("FoldColumn", { fg = brblack, bg = offwhite })

hi("IncSearch", { fg = normal, bg = bryellow })
hi("Search", { fg = normal, bg = bryellow })

hi("LineNr", { fg = yellow, gui = "bold" })
hi("MatchParen", { fg = normal, bg = brcyan })
hi("ModeMsg", { fg = brred })
hi("MoreMsg", { fg = green })
hi("NonText", { fg = normal })
hi("Question", { fg = green })
hi("SpecialKey", { fg = green })
hi("SpellBad", { gui = "undercurl", sp = brred })

hi("StatusLine", { fg = brblack })
hi("StatusLineNC", { fg = offwhite, bg = brblack })

hi("Title", { fg = normal, bg = darkoffwhite, gui = "bold" })

hi("Visual", { fg = offwhite, bg = brblack })
hi("VisualNOS", { fg = offwhite, bg = brblack })

hi("WarningMsg", { fg = blue })
hi("WildMenu", { fg = normal, bg = green })

hi("SignColumn", { fg = normal })

hi("Pmenu", { fg = red, bg = darkoffwhite })
hi("PmenuSel", { fg = offwhite, bg = brblack })
hi("PmenuSbar", { bg = darkoffwhite })
hi("PmenuThumb", { bg = brblack })

-- LSP
hi("LspDiagnosticsSignError", { fg = brred })
hi("LspDiagnosticsSignWarning", { fg = yellow })
hi("LspDiagnosticsSignInformation", { fg = brgreen })
hi("LspDiagnosticsSignHint", { fg = brblue })

hi("LspDiagnosticsDefaultError", { fg = normal })
hi("LspDiagnosticsDefaultWarning", { fg = normal })
hi("LspDiagnosticsDefaultInformation", { fg = normal })
hi("LspDiagnosticsDefaultHint", { fg = normal })


-- Git Fugitive
link("diffAdded", "diffAdd")
link("diffRemoved", "diffDelete")

-- Feline
hi("JMLFelineDefault", { fg = offwhite, bg = brblack })
hi("JMLFelineFileInfo", { fg = yellow, bg = darkoffwhite, gui = "bold" })
hi("JMLFelineInactive", { fg = yellow, bg = darkoffwhite, gui = "bold" })
hi("JMLFelineGit", { fg = bryellow, gui = "bold" })

-- nvim-cmp
hi("CmpItemKind", { fg = cyan, bg = darkoffwhite })
