return{
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    -- dependencies = {
    --   {'L3MON4D3/LuaSnip'},
    -- },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          {name = 'nvim_lsp'},
        },
        mapping = cmp.mapping.preset.insert({
          -- Navigate between completion items
          ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
          ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({select = false}),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- -- Navigate between snippet placeholder
          -- ['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
          -- ['<C-b>'] = cmp_action.vim_snippet_jump_backward(),

          -- Scroll up and down in the completion documentation
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        snippet = {
          -- expand = function(args)
          --   vim.snippet.expand(args.body)
          -- end,
        },
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      -- lsp_attach is where you enable features that only work
      -- if there is a language server active in the file
      local lsp_attach = function(client, bufnr)
        local opts = {buffer = bufnr}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

        -- golang format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
            local params = vim.lsp.util.make_range_params()
            params.context = {only = {"source.organizeImports"}}
            -- buf_request_sync defaults to a 1000ms timeout. Depending on your
            -- machine and codebase, you may want longer. Add an additional
            -- argument after params if you find that you have to write the file
            -- twice for changes to be saved.
            -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
            for cid, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then
                  local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                  vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
              end
            end
            vim.lsp.buf.format({async = false})
          end
        })
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })

      local util = require('lspconfig/util')

      -- These are just examples. Replace them with the language
      -- servers you have installed in your system
      -- require("lspconfig").tsserver.setup({})

      -- golang
      require("lspconfig").gopls.setup({
        cmd = { 'gopls', 'serve' },
        filetypes = { 'go', 'go.mod' },
        root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          }
        }
      })
      require("lspconfig").pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json"),
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              -- useLibraryCodeForTypes = false,
              -- typeCheckingMode = "off",
            },
          },
        },
      })
      -- rust
      require("lspconfig").rust_analyzer.setup({
        cmd = { 'rust-analyzer' },
        filetypes = { 'rust' },
        root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
        settings = {
        }
      })
    end
  }
}
