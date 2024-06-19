return {
	"jiaoshijie/undotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("undotree").setup()

		local wk = require("which-key")

		wk.register({
			["<leader>u"] = { "<cmd>lua require('undotree').toggle()<cr>", "Toggle Undotree" },
		})
	end,
}
