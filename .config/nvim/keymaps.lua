

wk.register({
    v = { "<C-S-v>", "Visual block mode" },
    e = { "<cmd>NvimTreeFindFile<CR>", "Explorer" },
    E = { "<cmd>NvimTreeClose<CR>", "Close explorer" },
    f = { "<cmd>Telescope find_files<CR>", "Find file" },
    F = { "<cmd>Telescope live_grep<CR>", "Find pattern" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    m = { "<cmd>Telescope marks<CR>", "Marks" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    l = { "o<Esc>k", "Insert empty line below" },
    L = { "O<Esc>", "Insert empty line above" },
    d = { "<cmd>DiffviewOpen<CR>", "Open diffview" },
    D = { "<cmd>DiffviewClose<CR>", "Close diffview" },
    g = { "<cmd>Neogit<CR>", "Neogit" },
    j = {
        name = "Jump",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    },
}, { prefix = "<leader>"}
)

-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>

nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
nmap Db <cmd>call vimspector#ToggleBreakpoint()<cr>
nmap Dw <cmd>call vimspector#AddWatch()<cr>
nmap De <cmd>call vimspector#Evaluate()<cr>
]])




