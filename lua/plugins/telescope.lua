return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    }
  },
  config = function()
    local builtin = require("telescope.builtin")

    -- find (in) files
    vim.keymap.set("n", "<leader>f", builtin.find_files, {})
    vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
    vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})

    -- buffers
    vim.keymap.set("n", "<leader>bf", builtin.buffers, {})

    -- registers
    vim.keymap.set("n", "<leader>rr", builtin.registers, {})

    -- lsp
    vim.keymap.set("n", "gr", builtin.lsp_references, {})
    vim.keymap.set("n", "<leader>dd", function()
      builtin.diagnostics({ bufnr = 0 })
    end)
    vim.keymap.set("n", "<leader>dw", builtin.diagnostics, {})
    vim.keymap.set("n", "<leader>pf", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set("n", "<leader>pp", function()
      builtin.live_grep()
    end)
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions, {})

    -- git
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
    vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
    vim.keymap.set("n", "<leader>gss", builtin.git_stash, {})

    require("telescope").load_extension("fzf")
  end,
}

