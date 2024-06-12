return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.splitjoin").setup({
      mappings = {
        toggle = "gS",
      },
    })

    require("mini.move").setup({
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = "<C-m>",
        right = "<C-i>",
        down = "<C-n>",
        up = "<C-e>",

        -- Move current line in Normal mode
        line_left = "<C-m>",
        line_right = "<C-i>",
        line_down = "<C-n>",
        line_up = "<C-e>",
      },
    })

    require("mini.surround").setup()

    require("mini.comment").setup()
  end,
}
