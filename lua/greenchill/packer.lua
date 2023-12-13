vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = {
            { 'nvim-lua/plenary.nvim' },
        }
    }

    use {'nyoom-engineering/oxocarbon.nvim'}
    use { 'Everblush/nvim', as = 'everblush' }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    use { 'theprimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }
    use { 'mattkubej/jest.nvim' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', as = 'rainbow-delimiters' }
    use { 'https://github.com/windwp/nvim-ts-autotag', as = 'nvim-ts-autotag' }
    use { 'https://github.com/terrortylor/nvim-comment', as = 'nvim-comment' }
    use { 'windwp/nvim-autopairs' }
    use { 'nvim-lualine/lualine.nvim' }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use { 'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'simrat39/rust-tools.nvim' },

            { 'rafamadriz/friendly-snippets' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end
    }

    use { 'michaeljsmith/vim-indent-object' }
end)
