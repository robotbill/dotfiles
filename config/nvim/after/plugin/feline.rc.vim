lua << EOF

local vi_mode_utils = require('feline.providers.vi_mode')

local components = {
    active = {},
    inactive = {}
}

-- Use a global status line
vim.opt.laststatus = 3

-- Duplicated from colors/jml.lua
local offblack = "#4C422F"

local darkoffwhite = "#e9e4da"
local offwhite = "#fffaf1"

table.insert(components.active, {})
table.insert(components.active, {})

-- Insert two sections (left and right) for the inactive statusline
table.insert(components.inactive, {})
table.insert(components.inactive, {})

components.active[1] = {
  {
    provider = 'vi_mode',
    hl = function()
      return {
        name = require('feline.providers.vi_mode').get_mode_highlight_name(),
        fg = require('feline.providers.vi_mode').get_mode_color(),
        style = 'bold'
      }
    end,
    left_sep = ' ',
    right_sep = ' ',
    icon = ''
  },
  -- Component that shows file info
  {
    provider = {
      name = 'file_info',
      opts = {
        type = 'relative'
      }
    },
    hl = 'JMLFelineFileInfo',
    left_sep = {' ', 'slant_left_2'},
    right_sep = {'slant_right_2', ' '},
    -- Uncomment the next line to disable file icons
    icon = ''
  },
  {
    provider = 'position'
  },
  {
    provider = 'line_percentage',
    left_sep = ' '
  }
}
-- Component that shows current git branch
components.active[2] = {
  {
    provider = 'git_branch',
    hl = 'JMLFelineGit',
    left_sep = ' ',
    right_sep = ' ',
    icon = '',
    truncate_hide = true
  }
}

components.inactive[1] = {
  {
    provider = {
      name = 'file_info',
      opts = {
        type = 'relative'
      }
    },
    hl = "JMLFelineInactive",
    left_sep = '',
    -- Uncomment the next line to disable file icons
    icon = ''
  },
  {
    hl = "JMLFelineInactive"
  }
}

require('feline').setup({
  components = components,
  colors = {
    bg = offblack,
    fg = offwhite
  }
})
EOF
