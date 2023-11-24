# Diverse notater om å konfigurere LunarVim

Få `ruff_lsp` til å funke sammen med `pyright`: [https://github.com/LunarVim/LunarVim/discussions/3877](https://github.com/LunarVim/LunarVim/discussions/3877).

```lua
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.ruff,
        null_ls.builtins.diagnostics.ruff,
    }
})
```

