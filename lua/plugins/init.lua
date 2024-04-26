local status, packer = pcall(require, "packer")

if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- Colorschema
	use("svrana/neosolarized.nvim")
	use("oxfist/night-owl.nvim")

	use("nvim-lualine/lualine.nvim")
	use("neovim/nvim-lspconfig")
	use({
		"glepnir/lspsaga.nvim",
	})
	use("tjdevries/colorbuddy.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	-- neo Tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})

	--Autocompletion
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")

	-- Autotag and autopair
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	--Telescope
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	use("kyazdani42/nvim-web-devicons")

	use("akinsho/bufferline.nvim")
	-- Formatter
	use("jose-elias-alvarez/null-ls.nvim")
	use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim" } })
	--Linter
	use({
		"norcalli/nvim-colorizer.lua",
	})
	--Comment
	use({
		"numToStr/Comment.nvim",
	})
	--Gits signs
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	})
	use({
		"dinhhuy258/git.nvim",
	})
	--Git
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"f-person/git-blame.nvim",
	})
	--Terminal
	use("NvChad/nvterm")

	--- Rust
	use("simrat39/rust-tools.nvim")

	--- Session
	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
			})
		end,
	})
	-- indent blankline
	use({
		"lukas-reineke/indent-blankline.nvim",
	})

	--Liveserver
	use({
		"aurum77/live-server.nvim",
		run = function()
			require("live_server.util").install()
		end,
	})
	--- Surround
	use({
		"kylechui/nvim-surround",
		tag = "*",
	})
end)
