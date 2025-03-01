-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")


-- Workaround for some weird error:
-- https://github.com/neovim/neovim/issues/30985
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end

lspconfig.rust_analyzer.setup({
    -- on_attach = on_attach,
    -- capabilities = capabilities,
    filetypes = {"rust"},
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
        ['rust-analyzer'] =  {
            cargo = {
                allFeatures = true,
            },
        },
    },
})

