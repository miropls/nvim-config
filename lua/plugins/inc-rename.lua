return {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup()

		vim.keymap.set("n", "<leader>rn", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { expr = true })

		local wk = require("which-key")

		wk.register({
			["<leader>rn"] = { "Rename symbol" },
		})
	end,
}
