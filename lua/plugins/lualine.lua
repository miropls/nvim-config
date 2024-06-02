return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local colors = require("cyberdream.colors").default
    local cyberdream = require("lualine.themes.cyberdream")
    local copilot_colors = {
      [""] = { fg = colors.grey, bg = colors.none },
      ["Normal"] = { fg = colors.grey, bg = colors.none },
      ["Warning"] = { fg = colors.red, bg = colors.none },
      ["InProgress"] = { fg = colors.yellow, bg = colors.none },
    }
    return {
      options = {
        component_separators = { left = " ", right = " " },
        section_separators = { left = " ", right = " " },
        theme = cyberdream,
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            "filename",
            symbols = { modified = "  ", readonly = "", unnamed = "" },
          },
          {
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
            end,
            color = { fg = colors.grey, bg = colors.none },
          },
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = colors.green },
          },
          {
            function()
              local icon = " "
              local status = require("copilot.api").status.data
              return icon .. (status.message or "")
            end,
            cond = function()
              local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
              return ok and #clients > 0
            end,
            color = function()
              if not package.loaded["copilot"] then
                return
              end
              local status = require("copilot.api").status.data
              return copilot_colors[status.status] or copilot_colors[""]
            end,
          },
          { "diff" },
        },
        lualine_y = {
          {
            "progress",
          },
          {
            "location",
            color = { fg = colors.cyan, bg = colors.none },
          },
        },
        lualine_z = {
          function()
            return "  " .. os.date("%X") .. " 🚀 "
          end,
        },
      },

      extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
    }
  end,
}
-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--     lazy = true,
--   },
--   config = function()
--     require("lualine").setup({
--       theme = "auto",
--       options = {
--         component_separators = "|",
--         -- section_separators = { left = "", right = "" },
--       },
--       sections = {
--         lualine_a = {
--           { "mode", right_padding = 2 },
--         },
--         -- lualine_a = {
--         --   { "mode", separator = { left = "" }, right_padding = 2 },
--         -- },
--         lualine_b = { "branch", "diff", "diagnostics" },
--         lualine_c = { { "filename", path = 4 }, "aerial" },
--         lualine_x = { "encoding", "fileformat", "filetype" },
--         lualine_y = { "progress" },
--         lualine_z = {
--           { "location", left_padding = 2 },
--         },
--         -- lualine_z = {
--         --   { "location", separator = { right = "" }, left_padding = 2 },
--         -- },
--       },
--       inactive_sections = {
--         lualine_a = { "filename" },
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {},
--         lualine_z = { "location" },
--       },
--       tabline = {},
--       extensions = {},
--     })
--   end,
-- }
