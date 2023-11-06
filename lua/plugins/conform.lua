return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { { "prettierd", "prettier" } },
				go = { "gofmt", "goimports" },
				rust = { "rustfmt" },
				yaml = { "yamlfix" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 1000, lsp_fallback = true }
			end,
		})

		-- Create command to toggle autoformatting on or offset
		-- leader fo to toggle, or use cmd
		vim.api.nvim_create_user_command("FormatToggle", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				if vim.b.disable_autoformat == true then
					vim.b.disable_autoformat = false
				else
					vim.b.disable_autoformat = true
				end
			else
				if vim.g.disable_autoformat == true then
					vim.g.disable_autoformat = false
				else
					vim.g.disable_autoformat = true
				end
			end
		end, {
			desc = "Toggle autoformatting",
			bang = true,
		})

		vim.keymap.set("n", "<leader>fo", vim.cmd.FormatToggle)
	end,
}
