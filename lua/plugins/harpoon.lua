return {
	"theprimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>k", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>m", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>n", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>e", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>i", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>l", function()
			harpoon:list():next()
		end)

		-- require("harpoon").setup({
		-- 	menu = {
		-- 		width = 120,
		-- 	},
		-- })
		-- local mark = require("harpoon.mark")
		-- local ui = require("harpoon.ui")
		--
		-- vim.keymap.set("n", "<leader>h", mark.add_file)
		-- vim.keymap.set("n", "<leader>k", ui.toggle_quick_menu)
		--
		-- vim.keymap.set("n", "<leader>m", function()
		-- 	ui.nav_file(1)
		-- end)
		-- vim.keymap.set("n", "<leader>n", function()
		-- 	ui.nav_file(2)
		-- end)
		-- vim.keymap.set("n", "<leader>e", function()
		-- 	ui.nav_file(3)
		-- end)
		-- vim.keymap.set("n", "<leader>i", function()
		-- 	ui.nav_file(4)
		-- end)

		local wk = require("which-key")

		wk.register({
			m = { "Harpoon:1" },
			n = { "Harpoon:2" },
			e = { "Harpoon:3" },
			i = { "Harpoon:4" },
			j = { "Harpoon:prev " },
			l = { "Harpoon:next" },
			k = { "Harpoon:list" },
			h = { "Harpoon:add to list" },
		}, { prefix = "<leader>" })
	end,
}
