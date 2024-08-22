local nvim_lsp = require('lspconfig')

vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>p', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
-- K vim.lsp.buf.hover (display information about symbol beneath cursor)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)
vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<Leader>f', function()
    vim.lsp.buf.format { async = true }
end)

-- Default to diagnostic text being enabled, and add a command to toggle it on
-- and off for when it's getting annoying.
vim.diagnostic.config {
  virtual_text = true,
  underline = true,
  signs = true,
}

vim.api.nvim_create_user_command("DiagnosticToggle", function()
    local config = vim.diagnostic.config
    local vt = config().virtual_text
    config {
        virtual_text = not vt,
        underline = not vt,
        signs = true,
    }
end, { desc = "toggle diagnostic" })

-- Default keybindings
vim.keymap.set('n', '<leader>dt', '<cmd>DiagnosticToggle<cr>', { noremap = true })

local lspconfig = require('lspconfig')
local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
)
lspconfig.tsserver.setup({
    on_init = function(client, initialization_result)
        if client.server_capabilities then
            -- This causes the syntax highlighting to change if enabled
            client.server_capabilities.semanticTokensProvider = false
        end
    end,
    capabilities = capabilities,
    settings = {
        diagnostics = {
            -- Ignore Type annotation can only be used in TypeScript file warning
            ignoredCodes = {8010}
        }
    }
})
-- lspconfig.eslint.setup({capabilities = capabilities})
lspconfig.solargraph.setup({capabilities = capabilities})
