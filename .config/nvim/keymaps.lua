

wk.register({
    v = { "<C-S-v>", "Visual block mode" },
    e = { "<cmd>NvimTreeFindFile<CR>", "Explorer" },
    E = { "<cmd>NvimTreeClose<CR>", "Close explorer" },
    f = { "<cmd>Telescope find_files<CR>", "Find file" },
    F = { "<cmd>Telescope live_grep<CR>", "Find pattern" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    m = { "<cmd>Telescope marks<CR>", "Marks" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    j = {
        name = "Jump",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    },
}, { prefix = "<leader>"}
)


