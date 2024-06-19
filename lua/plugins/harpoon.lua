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

		local wk = require("which-key")

		wk.register({
			m = { "Harpoon 1" },
			n = { "Harpoon 2" },
			e = { "Harpoon 3" },
			i = { "Harpoon 4" },
			k = { "Harpoon list" },
			h = { "Harpoon add to list" },
		}, { prefix = "<leader>" })
	end,
}
