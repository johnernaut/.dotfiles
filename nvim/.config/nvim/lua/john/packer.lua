vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("ThePrimeagen/harpoon")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("hrsh7th/cmp-cmdline")
	use("christoomey/vim-tmux-navigator")
	use("folke/tokyonight.nvim")
	use("numToStr/Comment.nvim")
	use("tpope/vim-sleuth")
	use("m4xshen/autoclose.nvim")
	use("tpope/vim-surround")
	use("mbbill/undotree")
	use("folke/zen-mode.nvim")
	use("github/copilot.vim")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvimtools/none-ls.nvim")
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } }
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		}
	})
end)
