

wk.register({
    v = { "<C-S-v>", "Visual block mode" },
    e = { "<cmd>NvimTreeFindFile<CR>", "Explorer" },
    E = { "<cmd>NvimTreeClose<CR>", "Close explorer" },
    f = { "<cmd>Telescope find_files<CR>", "Find file" },
    F = { "<cmd>Telescope live_grep<CR>", "Find pattern" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    m = { "<cmd>Telescope marks<CR>", "Marks" },
    l = {
        name = "LSP",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Jump to definition" },
    },
}, { prefix = "<leader>"}
)


