require'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "rust", "lua", "c", "markdown", "markdown_inline", "vim", "javascript", "toml", "html" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
}
