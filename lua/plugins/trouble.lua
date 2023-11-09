return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>di", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>dw", function()
			require("trouble").toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>dd", function()
			require("trouble").toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>dq", function()
			require("trouble").toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>dl", function()
			require("trouble").toggle("loclist")
		end)
		vim.keymap.set("n", "dr", function()
			require("trouble").toggle("lsp_references")
		end)
	end,
}
