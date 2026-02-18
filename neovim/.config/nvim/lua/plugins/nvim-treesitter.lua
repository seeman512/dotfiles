return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.config").setup({
        enusure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "help", "cmake", "go",},

        auto_install = true,

        highlight = {
          enable = true,
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "<leader>si",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end
  }
}
