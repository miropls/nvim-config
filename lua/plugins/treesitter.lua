return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,

	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or 'all'
			ensure_installed = { "c", "lua", "rust", "vimdoc", "javascript", "typescript" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (for 'all')
			ignore_install = {},

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = '/some/path/to/store/parsers', -- Remember to run vim.opt.runtimepath:append('/some/path/to/store/parsers')!
			autotag = {
				enable = true,
				enable_close_on_slash = false,
			},

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				additional_vim_regex_highlighting = false,
			},
		})
	end,
}

