return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},

    -- config = function()
    --   local fzf = require('fzf-lua')

    --   fzf.setup({
    --     keymap = {
    --       -- Below are the default binds, setting any value in these tables will override
    --       -- the defaults, to inherit from the defaults change [1] from `false` to `true`
    --       builtin = {
    --         -- neovim `:tmap` mappings for the fzf win
    --         -- true,        -- uncomment to inherit all the below in your custom config
    --         ["<shift-F1>"]        = "toggle-help",
    --         ["<shift-F2>"]        = "toggle-fullscreen",
    --         -- Only valid with the 'builtin' previewer
    --         ["<shift-F3>"]        = "toggle-preview-wrap",
    --         ["<shift-F4>"]        = "toggle-preview",
    --         -- Rotate preview clockwise/counter-clockwise
    --         ["<shift-F5>"]        = "toggle-preview-ccw",
    --         ["<shift-F6>"]        = "toggle-preview-cw",
    --         -- `ts-ctx` binds require `nvim-treesitter-context`
    --         ["<shift-F7>"]        = "toggle-preview-ts-ctx",
    --         ["<shift-F8>"]        = "preview-ts-ctx-dec",
    --         ["<shift-F9>"]        = "preview-ts-ctx-inc",
	-- 	  },
    --     },
    --   })
    -- end
  },
}
