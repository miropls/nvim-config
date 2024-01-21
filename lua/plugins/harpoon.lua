return {
	"theprimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			menu = {
				width = 120,
			},
		})
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>h", mark.add_file)
		vim.keymap.set("n", "<leader>k", ui.toggle_quick_menu)

		vim.keymap.set("n", "<leader>m", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<leader>n", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<leader>e", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<leader>i", function()
			ui.nav_file(4)
		end)
	end,
}
