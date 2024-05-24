local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-lua/plenary.nvim" },

    -- Visual
    -- { 'freddiehaddad/feline.nvim', opts = {} },
    { 'RRethy/base16-nvim' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Notes
    { "vimwiki/vimwiki", branch = "dev" },

    -- Snippets
    { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
    { "saadparwaiz1/cmp_luasnip" },

    -- Git
    { "tpope/vim-fugitive" },
    { "tpope/vim-rhubarb" },
    { "lewis6991/gitsigns.nvim" },

    -- LSP
    { "neovim/nvim-lspconfig" },

    -- Auto-Completion
    { "hrsh7th/cmp-nvim-lsp", branch = "main" },
    { "hrsh7th/cmp-buffer", branch = "main" },
    { "hrsh7th/cmp-path", branch = "main" },
    { "hrsh7th/nvim-cmp", branch = "main" },
    { "hrsh7th/cmp-cmdline", branch = "main" },

    -- fzf
    { "junegunn/fzf", build = "./install --all" },
    { "junegunn/fzf.vim" },

    -- Language Support
    { "dag/vim-fish" },
    { "elzr/vim-json", ft = "json" },
    { "tpope/vim-markdown" },
    { "fladson/vim-kitty" },

    -- Testing
    { "vim-test/vim-test" },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown", "vimwiki" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    { "scrooloose/nerdtree" },

    { "tpope/vim-repeat" },
    { "ggandor/leap.nvim" },
})
