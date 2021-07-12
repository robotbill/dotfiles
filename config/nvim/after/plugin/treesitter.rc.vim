if !exists('g:loaded_nvim_treesitter')
    finish
endif

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "fish",
    "html",
    "javascript",
    "json",
    "python",
    "ruby",
    "scss",
    "yaml"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
EOF
