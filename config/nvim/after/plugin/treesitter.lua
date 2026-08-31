local parsers = {
  "fish",
  "html",
  "javascript",
  "typescript",
  "json",
  "python",
  "ruby",
  "scss",
  "yaml",
}

require('nvim-treesitter').install(parsers)
vim.api.nvim_create_autocmd('FileType', {
  pattern = parsers,
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
