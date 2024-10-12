return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
		},
		"neovim/nvim-lspconfig",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"rust-analyzer",
			},
		})
	end,
}
