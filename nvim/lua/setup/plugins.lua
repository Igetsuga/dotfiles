local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end



local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end



local packer_bootstrap = ensure_packer()
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]



-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])



packer.startup(function(use)
	
	-- Packer can manage itself
	use("wbthomason/packer.nvim")



	-- Dashboard is a nice start screen for nvim
	-- use("glepnir/dashboard-nvim")

    -- LSP SERVER
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })

    use({
        "neovim/nvim-lspconfig",
        config = function()
            require('setup.plugins.lsp.lspconfig')
        end,
        requires = {
            {
                'hrsh7th/cmp-nvim-lsp',
            },
        },
    })

    use({
        {
            'hrsh7th/nvim-cmp',
            config = function()
                require('setup.plugins.lsp.nvim-cmp')
            end,
        },
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    })


	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
        config = function()
            require('setup.plugins.telescope')
        end,
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-file-browser.nvim")


	use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting

    -- Editor stuff
    use({
        'phaazon/hop.nvim',
        config = function()
            require('setup.plugins.hop')
        end,
    })

    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('setup.plugins.indentline')
        end,
    })

	-- git	
	-- use("tpope/vim-fugitive")

	use("lewis6991/gitsigns.nvim")
	use("rhysd/git-messenger.vim")
	use("sindrets/diffview.nvim")


	
	-- Productivity
	-- use("vimwiki/vimwiki")
	-- use("nvim-orgmode/orgmode")



	-- use("folke/which-key.nvim") -- Which Key
	-- use("nvim-lualine/lualine.nvim") -- A better statusline



	-- File management 
	use("vifm/vifm.vim")
	
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use("ryanoasis/vim-devicons")



	-- surroundings manager
	use("tpope/vim-surround")
	use("tpope/vim-commentary")



	-- Junegunn Choi Plugins --
	use("junegunn/goyo.vim")
	use("junegunn/limelight.vim")
	use("junegunn/vim-emoji")

	-- Colorschemes --
	use("RRethy/nvim-base16")
	use("kyazdani42/nvim-palenight.lua")
    use('folke/tokyonight.nvim')

	-- Other stuff --
	use("frazrepo/vim-rainbow")

	if packer_bootstrap then
		packer.sync()
	end
end)

