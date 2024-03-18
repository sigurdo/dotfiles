local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  "folke/which-key.nvim",

  { "folke/neoconf.nvim", cmd = "Neoconf" },

  "folke/neodev.nvim",

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  "neovim/nvim-lspconfig",
  "simrat39/rust-tools.nvim",

  -- Completions
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "hrsh7th/vim-vsnip",

  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",

  "nvim-tree/nvim-tree.lua",
}, {
    ui = {
        size = { width = 1.0, height = 1.0 },
    },
})

