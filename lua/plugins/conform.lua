return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				astro = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				vue = { { "prettierd", "prettier" } },
				blade = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				go = { "gofmt", "goimports" },
				rust = { "rustfmt" },
				yaml = { "yamlfix" },
				sql = { "sql-formatter" },
				php = { "intelephense" },
			},

			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 3000, lsp_fallback = true }
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>l", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

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

		local wk = require("which-key")

		wk.register({
			["<leader>fo"] = { "Toggle auto formatting" },
		})
	end,
}
