local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "rust_analyzer",
    "gopls",
    "sqls",
    "phpactor"
})

vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Auto insert parenthesis after function or method completion
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)

lsp.setup()
