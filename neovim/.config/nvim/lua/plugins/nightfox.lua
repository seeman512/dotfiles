return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "EdenEast/nightfox.nvim",

    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            -- statusline = 1000,
            -- tabline = 1000,
            -- winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'filename'},
          lualine_c = {'branch', 'diff', 'diagnostics'},
          lualine_x = {'encoding', 'fileformat'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = { },
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })

      require('nightfox').setup({
        options = {
          transparent = true,
          -- dim_inactive = true,
        },
        groups = {
          all = {
            Visual = { fg = "#111111", bg = "#73daca" },
          }
        },
        palettes = {
          carbonfox = {
            bg1 = "#000000",
            bg0 = "#1d1d2b",
          }
        }
      })
      -- vim.cmd.colorscheme("carbonfox")
      vim.cmd.colorscheme("nightfox")
    end
  }
}
