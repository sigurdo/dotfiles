-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- lvim.colorscheme = "monokai"

lvim.plugins = {
  { url = "https://github.com/sigurdo/monokai.nvim.git",
  -- { url = "https://github.com/normful/monokai.nvim.git",
  -- -- { "tanvirtin/monokai.nvim",
  -- --   config = function()
  -- --     local monokai = require("monokai")
  -- --     local palette = monokai.classic
  -- --     monokai.setup {
  -- --       palette = {
  -- --         base2 = '#272822',
  --         base3 = '#393a31',
  --       },
  --     }
  --   end
  },
}



lvim.colorscheme = "monokai"

lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeFocus<CR>", "Explorer" }
lvim.builtin.which_key.mappings["v"] = { "<C-v>", "Visual block mode" }
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

vim.opt.relativenumber = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.titlestring = "%t — LunarVim"

