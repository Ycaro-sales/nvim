return {
  --teste
  'nvim-lua/plenary.nvim',
  'tpope/vim-repeat',
  'mbbill/undotree',
  'nvim-telescope/telescope.nvim',
  'kyazdani42/nvim-web-devicons',
  'rcarriga/nvim-notify',
  {('nvim-treesitter/nvim-treesitter'), build = ':TSUpdate' },
  'ThePrimeagen/harpoon',
  'github/copilot.vim',

  --Telescope plugins
  'nvim-telescope/telescope-dap.nvim',
  'nvim-tree/nvim-tree.lua',
{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },

  --Treesitter
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-context',
  'windwp/nvim-ts-autotag',
  { 'Wansmer/treesj', config = function()
    require('treesj').setup({
      use_default_keymaps = false,
      max_join_length = 300,
    })
  end },

  --Help
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {}
    end
  },

  --Code Edition
  'windwp/nvim-autopairs',
  'mg979/vim-visual-multi',
  {
    'kylechui/nvim-surround',
    version = '*',
    config = function() require('nvim-surround').setup({ }) end,
  },
  'tpope/vim-unimpaired',
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },

  --Git
  'lewis6991/gitsigns.nvim',

  --UI
  'nvim-lualine/lualine.nvim',
  'lukas-reineke/indent-blankline.nvim',
  'nvim-tree/nvim-tree.lua',
  {
    'utilyre/barbecue.nvim',
    dependencies = { 'smiteshp/nvim-navic' },
    config = function() require('barbecue').setup() end,
  }, 'voldikss/vim-floaterm',
  'smiteshP/nvim-navbuddy',
  'MunifTanjim/nui.nvim',

  --Coments
  'tpope/vim-commentary',
  'tpope/vim-fugitive',

  --Debug
  'mfussenegger/nvim-dap',
  -- 'rcarriga/nvim-dap-ui',

  --lsp and autocompletion 
  
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  },

  'ray-x/lsp_signature.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'jose-elias-alvarez/typescript.nvim',
  'dmmulroy/tsc.nvim',
  

  { 'folke/trouble.nvim', config = function() require('trouble').setup { } end },

  --Preview
  -- 'frabjous/knap',

  --Colors
  'NvChad/nvim-colorizer.lua',

  --Colorschemes
  'ellisonleao/gruvbox.nvim',
  'neanias/everforest-nvim',
  'ful1e5/onedark.nvim',
  { 'rose-pine/neovim', name = 'rose-pine' },
}
