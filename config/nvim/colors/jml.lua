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

local default = "#000000"
local background = "NONE"
local comment_fg = "#080707"
local comment_bg = "#e5e4e5"
local constant_base = "#d75f00"

local darkgreen = "#005f00"

local hi = function(group, opts)
  vim.cmd(
    string.format("hi %s guifg=%s guibg=%s gui=%s guisp=%s",
      group,
      opts.fg or default,
      opts.bg or background,
      opts.gui or "NONE", 
      opts.sp or "NONE"
    )
  )
end

hi("Normal", { fg = fg })

hi("Comment", { fg = comment_fg, bg = comment_bg, gui = "italic" })

hi("Constant", { fg = constant_base })
hi("String", { fg = "#005faf" })
-- Character
hi("Number", { fg = "#af5f00" })
-- Boolean
-- Float

hi("Identifier", { fg = "#00005f" })
-- Function

hi("Statement", { fg = "#005f00", gui = "bold" })
-- Conditional
-- Repeat
-- Label
hi("Operator", { fg = "#870087" })
-- Keyword
-- Exception

hi("PreProc", { fg = "#000087" })
-- Include
-- Define
-- Macro
-- PreCondit

hi("Type", { fg = "#af0087" })
-- StorageClass
-- Structure
-- Typedef

hi("Special", { fg = "#8787d7" })
-- SpecialChar
-- Tag
-- Delimiter
-- SpecialComment
-- Debug

hi("Underlined", { fg = "#0000ff", bg = "#e4e4e4", gui = "underline" })

hi("Ignore", { fg = "#af00ff" })

hi("Error", { fg = "#ffffff", bg = "#d70000" })

-- TODO: make this better
--  FIXME: fix it
hi("Todo", { fg = comment_fg, bg = comment_bg, gui = "bold" })

hi("ColorColumn", { bg = "#eeeeee" })
hi("Directory", { fg = "#af5f00" })

hi("DiffAdd", { fg = "#0000d7" })
hi("DiffChange", { fg = "#af5f00" })
hi("DiffDelete", { fg = "#d70000" })
hi("DiffText", { fg = "#0000d7" })

hi("ErrorMsg", { fg = "#ff0000", bg = "#ffff00" })
hi("Vertsplit", { fg = "#444444" })

hi("Folded", { fg = "#444444", bg = "#c6c6c6" })
hi("FoldColumn", { fg = "#444444", bg = "#c6c6c6" })

hi("IncSearch", { fg = fg, bg = "#d7af00" })
hi("Search", { fg = fg, bg = "#d7af00" })

hi("LineNr", { fg = "#d75f00", bg = "#eeeeee", gui = "bold" })
hi("ModeMsg", { fg = "#ff0000" })
hi("MoreMsg", { fg = "#005f00" })
hi("NonText", { fg = fg })
hi("Question", { fg = "#005f00" })
hi("SpecialKey", { fg = "#005f00" })
hi("SpellBad", { gui = "underline", sp = "#ff0000" })

hi("StatusLine", { fg = "#444444" })
hi("StatusLineNC", { fg = "#d0d0d0", bg = "#585858" })

hi("Title", { fg = fg, bg = "#e4e4e4", gui = "bold" })

hi("Visual", { gui = "reverse" })
hi("VisualNOS", { gui = "reverse" })

hi("WarningMsg", { fg = "#000087" })
hi("WildMenu", { fg = fg, bg = "#00af87" })
