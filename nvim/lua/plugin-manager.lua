local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("plugins.nightfox"),
   {
        'nvim-telescope/telescope.nvim', 
        branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
              ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

              -- Install parsers synchronously (only applied to `ensure_installed`)
              sync_install = false,
              -- Automatically install missing parsers when entering buffer
              -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
              auto_install = true,

              highlight = { enable = true },
              indent = { enable = true },  
              incremental_selection = {
                enable = true,
                keymaps = {
                  init_selection = "<Leader>ss", -- set to `false` to disable one of the mappings
                  node_incremental = "<Leader>si",
                  scope_incremental = "<Leader>sc",
                  node_decremental = "<Leader>sd",
                },
              },

            textobjects = {
                select = {
                  enable = true,

                  -- Automatically jump forward to textobj, similar to targets.vim
                  lookahead = true,

                  keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    -- You can optionally set descriptions to the mappings (used in the desc parameter of
                    -- nvim_buf_set_keymap) which plugins like which-key display
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    -- You can also use captures from other query groups like `locals.scm`

                    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                  },
                  -- You can choose the select mode (default is charwise 'v')
                  --
                  -- Can also be a function which gets passed a table with the keys
                  -- * query_string: eg '@function.inner'
                  -- * method: eg 'v' or 'o'

                  -- and should return the mode ('v', 'V', or '<c-v>') or a table
                  -- mapping query_strings to modes.
                  selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'v', -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                  },
                  -- If you set this to `true` (default is `false`) then any textobject is
                  -- extended to include preceding or succeeding whitespace. Succeeding
                  -- whitespace has priority in order to act similarly to eg the built-in
                  -- `ap`.
                  --
                  -- Can also be a function which gets passed a table with the keys
                  -- * query_string: eg '@function.inner'
                  -- * selection_mode: eg 'v'
                  -- and should return true or false
                  include_surrounding_whitespace = true,

                },
              },
            })
        end
    },
    {'nvim-treesitter/nvim-treesitter-textobjects'},
    {"neovim/nvim-lspconfig",
        config = function()
            -- Setup language servers.
            local lspconfig = require('lspconfig')
            lspconfig.clangd.setup({})
            --lspconfig.pyright.setup {}
            --lspconfig.tsserver.setup {}
            --lspconfig.rust_analyzer.setup {
            --  -- Server-specific settings. See `:help lspconfig-setup`
            --  settings = {
            --    ['rust-analyzer'] = {},
            --  },
            --}

            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {

              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
              end,
            })
        end
    },
    require("plugins.nvim-web-devicons"),
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
})
