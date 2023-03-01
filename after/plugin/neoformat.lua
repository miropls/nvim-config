local group = vim.api.nvim_create_augroup("formatter", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { command = "Neoformat", group = group })
