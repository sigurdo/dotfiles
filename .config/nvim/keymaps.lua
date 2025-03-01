

wk.register({
    v = { "<C-S-v>", "Visual block mode" },
    e = { "<cmd>NvimTreeFindFile<CR>", "Explorer" },
    f = { "<cmd>Telescope find_files<CR>", "Find file" },
    F = { "<cmd>Telescope live_grep<CR>", "Find pattern" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    m = { "<cmd>Telescope marks<CR>", "Marks" },
    n = { "<cmd>noh<CR>", "No search highlight" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    q = { "<cmd>q<CR>", "Quit current buffer" },
    Q = { "<cmd>qa<CR>", "Quit all buffers" },
    w = { "<cmd>w<CR>", "Save current buffer" },
    W = { "<cmd>wa<CR>", "Save all buffers" },
    x = { "<cmd>xa<CR>", "Save and quit all buffers" },
    c = {
        name = "Code actions",
        f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
        o = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Other" },
    },
    d = { "<cmd>DiffviewOpen<CR>", "Open diffview" },
    D = { "<cmd>DiffviewClose<CR>", "Close diffview" },
    g = { "<cmd>Neogit<CR>", "Neogit" },
    j = {
        name = "Jump",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    },
    t = {
        name = "Toggle",
        e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
        n = { "<cmd>set number! relativenumber!<CR>", "Line numbers" },
        d = { "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>" , "Diagnostic" },
    },
    T = {
        name = "Hide",
        e = { "<cmd>NvimTreeClose<CR>", "Explorer" },
        n = { "<cmd>set nonumber norelativenumber<CR>", "Line numbers" },
    },
}, { prefix = "<leader>"}
)

-- wk.register({
--     ø = { "$", "Jump to end of line" },
--     Ø = { "^", "Jump to start of line" },
-- })

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

if vim.bo[vim.api.nvim_win_get_buf(0)].readonly then
    local presets = require("which-key.plugins.presets")
    presets.operators["d"] = nil
    wk.register({
        u = { "<c-u>", "Up half screen" },
        d = { "<c-d>", "Down half screen" },
    }, {})
    vim.cmd([[
        set clipboard+=unnamedplus
    ]])
end



