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
    {
        "nyoom-engineering/oxocarbon.nvim", 
        priority = 1000,
        config = function()
            -- Adjust colour groups for dark background and set theme.
            vim.opt.bg = "dark"
            -- vim.cmd("colorscheme oxocarbon")
        end
    },
    { 
        "EdenEast/nightfox.nvim",
        conifg = function()
            vim.cmd("colorscheme nightfox")
        end
    },
    {
          "folke/tokyonight.nvim",
          lazy = false,
          priority = 1000,
          opts = {},
    },
    {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "neovim/nvim-lspconfig",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
})
