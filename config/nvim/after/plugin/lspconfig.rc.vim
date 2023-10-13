if !exists('g:lspconfig')
    finish
endif

lua << EOF
local nvim_lsp = require('lspconfig')

vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  -- Mappings.
  local opts = { noremap=true, silent=true }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<Leader>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { "pyright", "solargraph", "tsserver" }
local servers = { "solargraph", "tsserver" }
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        diagnostics = {
            ignoredCodes = {8010}
        }
    }
}
require('lspconfig')['solargraph'].setup{
    on_attach = on_attach,
    capabilities = capabilities
}
EOF
