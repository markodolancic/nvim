return {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-treesitter/nvim-treesitter",             branch = "master" },
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    "nvim-treesitter/nvim-treesitter-context",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "nvim-telescope/telescope.nvim",
    { "ThePrimeagen/harpoon", branch = "harpoon2" },
    "folke/tokyonight.nvim",
    "nvim-lualine/lualine.nvim",
    "brenoprata10/nvim-highlight-colors",
    "nvim-orgmode/orgmode",
    "tpope/vim-fugitive",
    "mbbill/undotree",
    "ojroques/vim-oscyank",
    "captbaritone/better-indent-support-for-php-with-html",
    {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {},
      -- Optional dependencies
      dependencies = { { "nvim-mini/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
      -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
      lazy = false,
    }
}
